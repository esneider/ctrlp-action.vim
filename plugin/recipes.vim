""""""""""""
" Load guard
""""""""""""

if exists('g:loaded_recipes') && g:loaded_recipes
    finish
endif

let g:loaded_recipes = 1

""""""
" Vars
""""""

" Global data
let g:recipes_opts = {
\
\   'cmd_len': get(g:, 'recipes_cmd_len', 11),
\   'cr_char': get(g:, 'recipes_cr_char', '↩'),
\   'markers': ['  ', '. ', ', '],
\   'cmd_list': [],
\   'cmd_dict': {}
\}

let s:opts = g:recipes_opts
let s:opts.mrk_ptr = '\V\(' . join(s:opts.markers, '\|') . '\)\$'

" Current file and section name
let s:section = {'file': '', 'name': ''}

" Correct command usage
let s:usage = {
\   'Recipe': "Recipe 'command' 'description' ['help_tag']",
\   'RecipeSection': "RecipeSection ['section']"
\}

"""""""
" Utils
"""""""

function! s:add(bang, cmd, action, help)

    let cmd   = a:bang ? '' : a:cmd
    let kcode = '\v\<\w(\w|-)*\w\>'
    let enter = match(cmd, '\c<CR>$')
    let space = match(cmd, '\c\(<Space>\| \)$')
    let pos   = match(cmd, '\c\(<Left>\)\+$')

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
    let section = s:section.name =~ '^\s*$' ? '' : s:section.name . ': '

    " Pretty print
    let len = s:opts.cmd_len + len(cmd) - len
    let rcp = substitute(a:action, '\s*$', '', '')
    let cmd = printf("%*s\t%s%s", len, cmd, section, rcp)

    " Transform literal keycodes
    let kcodes = substitute(a:cmd, kcode, '\=eval("\"\\".submatch(0)."\"")', '')

    " Create help command
    let help = "Sorry, no help for this recipe"
    let help = 'echo "' . help . '"' . "\<CR>"
    let help = empty(a:help) ? help : 'help ' . a:help . "\<CR>"

    call add(s:opts.cmd_list, cmd)
    let s:opts.cmd_dict[cmd] = {'keycode': kcodes, 'help': help}
endf

function! s:parse_args(args)

    let arg_pat = '\v(' . "'([^']|'')*'" . '|' . '"([^"\]|\.)*"' . ')'
    let cmd_pat = '\v^(' . arg_pat . '|\s)*' . '("([^"\]|\.)*)?$'
    let parsed  = []

    if a:args =~ cmd_pat
        call substitute(a:args, arg_pat, '\=add(parsed, eval(submatch(0)))', 'g')
    endif

    return parsed
endf

function! s:invalid_call(cmd, sfile, sline, bang, args)

    echomsg 'Invalid ' . a:cmd

    if !empty(a:sfile)
        echomsg 'In ' . a:sfile . ':' . a:sline
    endif

    echomsg '  ' . a:cmd . a:bang . ' ' . a:args
    echomsg 'Should be: ' . s:usage[a:cmd]
endf

function! s:add_recipe_cmd(sfile, sline, bang, args)

    " Parse ans check args
    let parsed = s:parse_args(a:args)

    if len(parsed) > 3 || len(parsed) < 2 || parsed[1] =~ '^\s*$'
        call s:invalid_call('Recipe', a:sfile, a:sline, a:bang, a:args)
        return
    endif

    " Maintain section
    if s:section.file != a:sfile
        let s:section.file = a:sfile
        let s:section.name = ''
    endif

    " Add parsed recipe
    call s:add('!' == a:bang, parsed[0], parsed[1], get(parsed, 2, ''))
endf

function! s:add_section_cmd(sfile, sline, args)

    " Parse ans check args
    let parsed = s:parse_args(a:args)

    if len(parsed) > 1
        call s:invalid_call('RecipeSection', a:sfile, a:sline, '', a:args)
        return
    endif

    " Maintain section
    let s:section.file = a:sfile
    let s:section.name = get(parsed, 0, '')
endf

""""""""
" Public
""""""""

function! recipes#load()
endf

command! -nargs=+ -bang Recipe
\   call s:add_recipe_cmd(
\       expand('<sfile>:p'),
\       expand('<slnum>'),
\       '<bang>',
\       <q-args>
\   )

command! -nargs=? RecipeSection
\   call s:add_section_cmd(
\       expand('<sfile>:p'),
\       expand('<slnum>'),
\       <q-args>
\   )
