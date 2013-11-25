""""""""""""
" Load guard
""""""""""""

if exists('g:loaded_recipes_ctrlp') && g:loaded_recipes_ctrlp
    finish
endif

let g:loaded_recipes_ctrlp = 1

call recipes#load()

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

function! recipes#ctrlp#init()

    setlocal filetype=recipes.vim encoding=utf-8 scrolloff=0 nolist
    setlocal noexpandtab shiftwidth=4 tabstop=4 softtabstop=4 cursorline

    return g:recipes_opts.cmd_list
endf

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
    let type = cmd =~ '^[:/?]' ? cmd[0] : '@'
    let hist = cmd !~ '^[:/?]' ? cmd : cmd =~ "\r$" ? cmd[1:-2] : ''

    call histadd(type, hist)
    call feedkeys(cmd)
endf

function! recipes#ctrlp#id()

    return s:id
endf

