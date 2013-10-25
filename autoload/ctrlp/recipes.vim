""""""""""""
" Load guard
""""""""""""

if exists('g:loaded_ctrlp_recipes') && g:loaded_ctrlp_recipes
    finish
endif

let g:loaded_ctrlp_recipes = 1

"""""""""
" Options
"""""""""

let s:cr_char = get(g:, 'recipes_cr_char', '↩')
let s:cmd_len = get(g:, 'recipes_cmd_len', 11)
let s:rlist   = get(g:, 'recipes', [])


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
    let recipes = s:rlist

    for rfile in rfiles
        call extend(recipes, readfile(rfile))
    endfor

    return recipes
endf

function! s:pretty_print(cmd, action)

    " Prettify CRs
    let cmd = substitute(a:cmd, '<CR>$', s:cr_char, '')

    " Real command length
    let rlen = len(split(cmd, '\zs'))
    let rlen -= cmd =~ ' $'
    let rlen -= cmd =~ s:cr_char . '$'

    " Clear long commands
    if rlen > s:cmd_len | let cmd = '' | let rlen = 0 | endif

    " Pretty print
    let rlen = s:cmd_len + len(cmd) - rlen
    return printf("%*s\t%s", rlen, cmd, a:action)
endf

function! s:prepare(recipes)

    " Remove empty recipes
    call filter(a:recipes, 'v:val =~ "^\\S.*"')

    for i in range(len(a:recipes))

        " Remove multiple tabs
        let rlist = split(substitute(a:recipes[i], '\t\+', '\t', ''), '\t')
        " Transform literal keycodes
        let cmd = substitute(rlist[0], '\v\<(\w|-)+\>', '\=eval("\"\\".submatch(0)."\"")', '')
        " Save command
        let s:cmds[rlist[1]] = cmd

        let a:recipes[i] = s:pretty_print(rlist[0], rlist[1])
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
