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
\})

let s:id = g:ctrlp_builtins + len(g:ctrlp_ext_vars)

""""""""
" Public
""""""""

function! recipes#ctrlp#init()

    setlocal filetype=recipes.vim encoding=utf-8 scrolloff=0 nolist
    setlocal noexpandtab shiftwidth=4 tabstop=4 softtabstop=4

    return g:recipes_list
endf

function! recipes#ctrlp#accept(mode, choice)

    call ctrlp#exit()

    let choice = substitute(a:choice, g:recipes_mrk_ptr, '', '')
    let action = g:recipes_cmds[choice]
    let cmd    = a:mode == 'v' ? action.help : action.keycode
    let type   = stridx(':/?', cmd[0]) == -1 ? '@' : cmd[0]

    call feedkeys(cmd)
    call histadd(type, type == '@' ? cmd : cmd[1:])
endf

function! recipes#ctrlp#id()

    return s:id
endf
