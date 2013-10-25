""""""""""""
" Load guard
""""""""""""

if exists('g:loaded_ctrlp_recipes') && g:loaded_ctrlp_recipes
    finish
endif

let g:loaded_ctrlp_recipes = 1

""""""
" Vars
""""""

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
let s:cmds = {}

"""""""
" Utils
"""""""

function! s:load_recipes()

    let rfiles = split(&rtp, ',') + [s:path]
    let rfiles = map(rfiles, 'v:val . "/recipes.txt"')
    let rfiles = filter(rfiles, 'filereadable(v:val)')
    let recipes = []

    for rfile in rfiles
        call extend(recipes, readfile(rfile))
    endfor
    call extend(recipes, get(g:, 'ctrlp_recipes', []))

    return recipes
endf

function! s:prepare(recipes)

    call filter(a:recipes, 'v:val =~ "^\\S.*"')

    for i in range(len(a:recipes))
        let rlist = split(substitute(a:recipes[i], '\t\+', '\t', ''), '\t')
        let cmd = substitute(rlist[0], '\v\<(\w|-)+\>', '\=eval("\"\\".submatch(0)."\"")', '')
        let s:cmds[rlist[1]] = cmd

        let rlen = len(rlist[0]) - 3 * (rlist[0] =~ "<CR>$")
        let rlist[0] = rlen > 12 ? '' : substitute(rlist[0], '<CR>$', '↩', '')

        let rlen = 12 + 2 * (rlist[0] =~ '↩')
        let a:recipes[i] = printf("%*s\t%s", rlen, rlist[0], rlist[1])
    endfor

    return a:recipes
endf

""""""""
" Public
""""""""

function! ctrlp#recipes#init()

    let b:recipesCmdLine = 1
    setfiletype recipes.txt

    return s:prepare(s:load_recipes())
endf

function! ctrlp#recipes#accept(mode, choice)

    call ctrlp#exit()
    call feedkeys(s:cmds[split(a:choice, '\t')[1]])
endf

function! ctrlp#recipes#id()

    return s:id
endf
