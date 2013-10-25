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

""""""""
" Public
""""""""

function! ctrlp#recipes#init()

    let b:recipesCmdLine = 1
    setfiletype recipes.txt

    let rfiles = split(&rtp, ',') + [s:path]
    let rfiles = map(rfiles, 'v:val . "/recipes.txt"')
    let rfiles = filter(rfiles, 'filereadable(v:val)')

    let recipes = []

    for rfile in rfiles
        call extend(recipes, readfile(rfile))
    endfor

    if exists('g:ctrlp_recipes')
        call extend(recipes, g:ctrlp_recipes)
    endif

    call filter(recipes, 'v:val =~ "^\\S.*"')
    call map(recipes, 'substitute(v:val, "\t\t*", "\t", "g")')

    return recipes
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
