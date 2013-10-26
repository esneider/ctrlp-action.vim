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
let s:recipes = get(g:, 'recipes', [])
let s:cmds    = {}

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

let s:id = g:ctrlp_builtins + len(g:ctrlp_ext_vars)

"""""""
" Utils
"""""""

function! s:load_recipes()

    return recipes
endf

function! s:print(args)

    let cmd   = a:args[0]
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

    " Pretty print
    let len = s:cmd_len + len(cmd) - len
    let cmd = printf("%*s\t%s", len, cmd, a:args[1])

    " Transform literal keycodes
    let kcodes = substitute(a:args[0], kcode, '\=eval("\"\\".submatch(0)."\"")', '')
    let s:cmds[cmd] = kcodes

    return cmd
endf

""""""""
" Public
""""""""

function! ctrlp#recipes#init()

    let b:recipesCmdLine = 1
    setfiletype recipes.txt

    let recipes = map(s:recipes, 'type(v:val) == 3 ? join(v:val, "\t") : v:val')
    for dir in split(&rtp, ',')
        silent! call extend(recipes, readfile(dir . '/recipes.txt'))
    endfor
    let recipes = filter(recipes, 'v:val =~ "^\\S.*\t.*\\S"')

    return map(recipes, 'print(split(v:val, "\t"))')
endf

function! ctrlp#recipes#accept(mode, choice)

    call ctrlp#exit()
    let choice = substitute(a:choice, "[\u2060\u2061\u2062]", '', '')
    call feedkeys(g:recipes_cmds[choice])
endf

function! ctrlp#recipes#id()

    return s:id
endf
