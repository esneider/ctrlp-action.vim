""""""
" Vars
""""""

call add(g:ctrlp_ext_vars, {
\   'init': 'recipes#ctrlp#init()',
\   'accept': 'recipes#ctrlp#accept',
\   'lname': 'recipes',
\   'sname': 'rcp',
\   'type': 'path',
\   'sort': 0,
\   'nolim': 1,
\   'specinput': 0,
\   'sanstail': 0,
\})

let s:id = g:ctrlp_builtins + len(g:ctrlp_ext_vars)

""""""""
" Public
""""""""

" Set up the CtrlP buffer.
"
" Returns:
"   string[], a list of recipe strings.
function! recipes#ctrlp#init()

    setlocal filetype=recipes.vim encoding=utf-8 scrolloff=0 nolist
    setlocal noexpandtab shiftwidth=4 tabstop=4 softtabstop=4 cursorline

    return g:recipes_opts.cmd_list
endf

" Execute correct action after user selection.
"
" Arguments:
"   mode: string, one of h, t, v, e, depending on the user action.
"   choice: string, user selected recipe.
function! recipes#ctrlp#accept(mode, choice)

    call ctrlp#exit()

    " Get command
    let choice = substitute(a:choice, g:recipes_opts.mrk_ptr, '', '')
    let action = g:recipes_opts.cmd_dict[choice]
    let cmd    = {
    \   'h':      ':bo ' . action.help,
    \   't':     ':tab ' . action.help,
    \   'v': ':bo vert ' . action.help,
    \   'e': action.keycode
    \ }[a:mode]

    " Process command to add it to the history
    let type = cmd =~ '\v^[:/?]' ? cmd[0] : '@'
    let hist = cmd !~ '\v^[:/?]' ? cmd : cmd =~ "\r$" ? cmd[1:-2] : ''

    " If the recipe command had a bang, allow user mappings
    let mode = action.bang ? 'm' : 'n'

    call histadd(type, hist)
    call feedkeys(cmd, mode)
endf

" Override CtrlP matcher with our own when the Recipe browser is opened.
function! recipes#ctrlp#open()

    " This is a hack to change the default matcher just for this
    " ctrlp-extension, without changing the global matcher. The only drawback
    " is that when the plugin is opened via another ctrlp mode, we have to
    " fall back to the ctrlp file matcher.

    let matcher = get(g:, 'ctrlp_match_func', {})
    let g:ctrlp_match_func = {'match': 'recipes#matcher#match'}

    call ctrlp#init(s:id)

    let g:ctrlp_match_func = matcher
endf

