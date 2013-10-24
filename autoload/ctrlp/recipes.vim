""""""""""""
" Load guard
""""""""""""

if exists('g:loaded_ctrlp_recipes') && g:loaded_ctrlp_recipes
    finish
endif

let g:loaded_ctrlp_recipes = 1

""""""""""""
" CtrlP vars
""""""""""""

call add(g:ctrlp_ext_vars, {
\   'init': 'ctrlp#recipes#init()',
\   'accept': 'ctrlp#recipes#accept',
\   'lname': 'recipes',
\   'sname': 'rcp',
\   'type': 'path',
\   'sort': 1,
\   'nolim': 1,
\})

let s:id   = g:ctrlp_builtins + len(g:ctrlp_ext_vars)
let s:path = expand("<sfile>:p:h")

"""""""
" Utils
"""""""

function! s:syntax()
    if !ctrlp#nosy()
        call ctrlp#hicheck('CtrlPTabExtra', 'Comment')
        syn match CtrlPTabExtra '^\zs[^\t]*\t\ze'
    endif
endfunction

function! s:load_recipes()
    let s:recipes = readfile(s:path . "/recipes.txt")

    if exists("g:ctrlp_recipes")
        call extend(s:recipes, g:ctrlp_recipes)
    endif

    call filter(s:recipes, 'v:val =~ "^\\S.*"')
endfunction

""""""""
" Public
""""""""

function! ctrlp#recipes#init()
    call s:syntax()
    return s:recipes
endfunction

function! ctrlp#recipes#accept(mode, choice)
    call ctrlp#exit()

    let cmd = split(a:choice, '\t')[0]
    if cmd[0] == ':'
        let cmd .= "\n"
    endif

    call feedkeys(cmd)
endfunction

function! ctrlp#recipes#id()
    return s:id
endfunction

""""""
" Init
""""""

call s:load_recipes()
