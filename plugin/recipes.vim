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

let s:cr_char = get(g:, 'recipes_cr_char', '↩')
let s:cmd_len = get(g:, 'recipes_cmd_len', 11)
let s:section = {'file': '', 'name': ''}
let s:arg_pat = '\v(' . "'([^']|'')*'" . '|' . '"([^"\]|\.)*"' . ')'

let g:recipes_markers = ['  ', '. ', ', ']
let g:recipes_mrk_ptr = '\V\(' . join(g:recipes_markers, '\|') . '\)\$'
let g:recipes_list    = []
let g:recipes_cmds    = {}

"""""""
" Utils
"""""""

function! s:add(bang, cmd, action, help)

    let cmd   = a:bang ? '' : a:cmd
    let kcode = '\v\<(\w|-)+\>'
    let enter = match(cmd, '\c<CR>$')
    let space = match(cmd, '\c\(<Space>\| \)$')
    let pos   = match(cmd, '\v\c%(\<(Left|Right|Home|End)\>)+$')

    " Compress trailing keycodes
        if enter > 0 | let cmd = substitute(cmd, '<CR>$', s:cr_char, 'i')
    elseif space > 0 | let cmd = substitute(cmd, '<Space>$', ' ', 'i')
    elseif pos   > 0 | let cmd = cmd[ : (pos - 1) ]
    endif

    " Real command length
    let len = len(split(cmd, '\zs')) - (space > 0 || enter > 0)
    " Clear long commands
    if len > s:cmd_len | let cmd = '' | let len = 0 | endif

    " Get section
    let section  = s:section.name
    let section .= empty(section) ? '' : ': '

    " Pretty print
    let len = s:cmd_len + len(cmd) - len
    let rcp = substitute(a:action, '\s*$', '', '')
    let cmd = printf("%*s\t%s%s", len, cmd, section, rcp)

    " Transform literal keycodes
    let kcodes = substitute(a:cmd, kcode, '\=eval("\"\\".submatch(0)."\"")', '')

    " Create help command
    let help = "Sorry, no help for this recipe"
    let help = 'echo "' . help . '"' . "\<CR>"
    let help = empty(a:help) ? help : 'help ' . a:help . "\<CR>"

    call add(g:recipes_list, cmd)
    let g:recipes_cmds[cmd] = {'keycode': kcodes, 'help': help}
endf

function! s:add_recipe_cmd(sfile, sline, bang, args)

    " Process valid args
    let args = []
    call substitute(a:args, s:arg_pat, '\=add(args, eval(submatch(0)))', 'g')

    " Check input format
    if match(args, '^\s*$') >= 0 || len(args) / 2 != 1

        echomsg 'Invalid Recipe'
        if !empty(a:sfile) | echomsg 'In ' . a:sfile . ':' . a:sline | endif
        echomsg '  Recipe' . a:bang . ' ' . a:args
        echomsg "Should be: Recipe 'command' 'description' ['help_tag']"

        return
    endif

    " Maintain section
    if s:section.file != a:sfile
        let s:section.file = a:sfile
        let s:section.name = ''
    endif

    " Add parsed recipe
    call s:add('!' == a:bang, args[0], args[1], get(args, 2, ''))
endf

function! s:add_section_cmd(sfile, sline, args)

    " Remove comments and strip spaces
    let args = substitute(a:args, '\v^\s*("([^"\\]|\\.)*)?\s*$', '', '')

    " Check input format
    if args !~ '\v\s*^(' . s:arg_pat . ')?\s*$'

        echomsg 'Invalid RecipeSection'
        if !empty(a:sfile) | echomsg 'In ' . a:sfile . ':' . a:sline | endif
        echomsg '  RecipeSection ' . a:args
        echomsg "Should be: RecipeSection ['section']"

        return
    endif

    " Maintain s:section
    let s:section.file = a:sfile
    let s:section.name = empty(args) ? '' : eval(args)
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
