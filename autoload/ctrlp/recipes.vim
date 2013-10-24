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
\   'sort': 0,
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

        if has('conceal')
            setlocal conceallevel=2
            syn match CtrlPConceal '\zs<[Cc][Rr]>\ze\t' conceal containedin=CtrlPTabExtra
        endif
    endif
endf

function! s:recipes()

    let recipes = readfile(s:path . '/recipes.txt')

    if exists('g:ctrlp_recipes')
        call extend(recipes, g:ctrlp_recipes)
    endif

    call filter(recipes, 'v:val =~ "^\\S.*"')
    call map(recipes, 'substitute(v:val, "\t\t*", "\t", "g")')

    return recipes
endf

""""""""
" Public
""""""""

function! ctrlp#recipes#init()

    call s:syntax()
    return s:recipes()
endf

function! ctrlp#recipes#accept(mode, choice)

    call ctrlp#exit()

    let cmd = split(a:choice, '\t')[0]
    let cmd = substitute(cmd, '\v\<([CSATM]-)*\w+\>', '\=eval("\"\\".submatch(0)."\"")', 'i')

    call feedkeys(cmd)
endf

function! ctrlp#recipes#id()

    return s:id
endf
