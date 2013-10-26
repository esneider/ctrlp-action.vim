""""""""""""
" Load guard
""""""""""""

if exists('g:loaded_recipes_ctrlp') && g:loaded_recipes_ctrlp
    finish
endif

let g:loaded_recipes_ctrlp = 1

call recipes#init()

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

    setfiletype recipes.vim
    return g:recipes_list
endf

function! recipes#ctrlp#accept(mode, choice)

    call ctrlp#exit()
    let choice = substitute(a:choice, "[\u2060\u2061\u2062]", '', '')
    call feedkeys(g:recipes_cmds[choice])
endf

function! recipes#ctrlp#id()

    return s:id
endf
