" File: recipes.vim
"
" Functions for adding recipes and recipes sections. If the command parsing
" fails, an appropiate message is shown. Else, the arguments are processed and
" added to the relevant data structures:
"
"   g:recipes_opts.cmd_list: list of lines for the recipe browser.
"   g:recipes_opts.cmd_dict: information for each line of the list.

""""""
" Vars
""""""

" Global plugin variables.
let s:opts = g:recipes_opts

" Current file and section name.
let s:section = {'file': '', 'name': ''}

" Correct command usage.
let s:usage = {
\   'Recipe': "Recipe(command, description, help_tag='')",
\   'RecipeSection': "RecipeSection(section='')",
\}

"""""""
" Utils
"""""""

" Preprocess recipe for later usage.
"
" Arguments:
"   bang:   boolean, wheter the command had the ! modifier.
"   cmd:    string, recipe keycodes.
"   action: string, recipe description.
"   help:   string, recipe help command.
function! s:add_recipe(bang, cmd, action, help)

    let cmd   = a:cmd
    let kcode = '\v\<\w(\w|-)*\w\>'
    let enter = match(cmd, '\c<CR>$')
    let space = match(cmd, '\v\c(\<Space\>| )$')
    let pos   = match(cmd, '\v\c%(\<(Left|Right|Home|End)\>)+$')

    " Compress trailing keycodes
        if enter > 0 | let cmd = substitute(cmd, '<CR>$', s:opts.cr_char, 'i')
    elseif space > 0 | let cmd = substitute(cmd, '<Space>$', ' ', 'i')
    elseif pos   > 0 | let cmd = cmd[ : (pos - 1) ]
    endif

    " Real command length
    let len = len(split(cmd, '\zs')) - (space > 0 || enter > 0)
    " Clear long commands
    if len > s:opts.cmd_len | let cmd = '' | let len = 0 | endif

    " Get section
    let section = s:section.name =~ '\v^\s*$' ? '' : s:section.name . ': '

    " Pretty print
    let len = s:opts.cmd_len + len(cmd) - len
    let rcp = substitute(a:action, '\v\s*$', '', '')
    let cmd = printf("%*s\t%s%s", len, cmd, section, rcp)

    " Transform literal keycodes
    let kcodes = substitute(a:cmd, kcode, '\=eval("\"\\".submatch(0)."\"")', 'g')

    " Create help command
    let help = "Sorry, no help for this recipe"
    let help = 'echo "' . help . '"' . "\<CR>"
    let help = empty(a:help) ? help : 'help ' . a:help . "\<CR>"

    call add(s:opts.cmd_list, cmd)
    let s:opts.cmd_dict[cmd] = {'keycode': kcodes, 'help': help, 'bang': a:bang}
endf

" Tokenize the arguments string.
"
" Arguments:
"   args: string, raw copy of the arguments.
" Returns:
"   string[], a list of tokens, or 0 if there was a parse error.
function! s:parse_args(args)

    " Pattern for a command argument in the form of a function (via <q-args>).
    let cmd_pat = '\v\(\zs.{-}\ze\)' . '(\s*"([^"\\]|\\.)*)?$'
    " Pattern for a string.
    let str_pat = '\v(' . "'([^']|'')*'" . '|' . '"([^"\\]|\\.)*"' . ')'
    " Pattern for a function argument list.
    let arg_pat = '\v(\s*' . str_pat . '\s*,)*(\s*' . str_pat . ')?'

    let fargs = matchstr(a:args, cmd_pat)

    if a:args !~ cmd_pat || fargs !~ arg_pat
        return 0
    endif

    let parsed = []
    call substitute(fargs, str_pat, '\=add(parsed, eval(submatch(0)))', 'g')
    return parsed
endf

" Show message after an invalid command call.
"
" Arguments:
"   cmd:   string, command name.
"   sfile: string, current file path.
"   sline: number, current line.
"   bang:  string, '!' if the command had the ! modifier.
"   args:  string, raw copy of the arguments.
function! s:invalid_call(cmd, sfile, sline, bang, args)

    echomsg 'Invalid ' . a:cmd

    if !empty(a:sfile)
        echomsg 'In ' . a:sfile . ':' . a:sline
    endif

    echomsg '  ' . a:cmd . a:bang . a:args
    echomsg 'Should be: ' . s:usage[a:cmd]
endf

""""""""
" Public
""""""""

" Command to add a new recipe.
"
" Arguments:
"   sfile: string, current file path.
"   sline: number, current line.
"   bang:  string, '!' if the command had the ! modifier.
"   args:  string, raw copy of the arguments.
function! recipes#add_recipe(sfile, sline, bang, args)

    " Parse and check args
    let fargs = s:parse_args(a:args)

    if !type(fargs) || len(fargs) > 3 || len(fargs) < 2 || fargs[1] =~ '\v^\s*$'
        call s:invalid_call('Recipe', a:sfile, a:sline, a:bang, a:args)
        return
    endif

    " Maintain section
    if s:section.file != a:sfile
        let s:section.file = a:sfile
        let s:section.name = ''
    endif

    " Add parsed recipe
    call s:add_recipe('!' == a:bang, fargs[0], fargs[1], get(fargs, 2, ''))
endf

" Command to add a new recipe section.
"
" Arguments:
"   sfile: string, current file path.
"   sline: number, current line.
"   args:  string, raw copy of the arguments.
function! recipes#add_section(sfile, sline, args)

    " Parse ans check args
    let fargs = s:parse_args(a:args)

    if !type(fargs) || len(fargs) > 1
        call s:invalid_call('RecipeSection', a:sfile, a:sline, '', a:args)
        return
    endif

    " Maintain section
    let s:section.file = a:sfile
    let s:section.name = get(fargs, 0, '')
endf

