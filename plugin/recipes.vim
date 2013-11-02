""""""""""""
" Load guard
""""""""""""

if exists('g:loaded_recipes') && g:loaded_recipes
    finish
endif

let g:loaded_recipes = 1

""""""
" Vars
""""""

let s:cr_char = get(g:, 'recipes_cr_char', '↩')
let s:cmd_len = get(g:, 'recipes_cmd_len', 11)

let g:recipes_markers = ['  ', '. ', ', ']
let g:recipes_mrk_ptr = '\V\(' . join(g:recipes_markers, '\|') . '\)\$'
let g:recipes_list    = []
let g:recipes_cmds    = {}

let s:error = "Invalide Recipe. Should be: Recipe 'command' 'description' ['help_tag']"

"""""""
" Utils
"""""""

function! s:add(bang, cmd, action, help)

    let cmd   = a:bang ? '' : a:cmd
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
    let cmd = printf("%*s\t%s", len, cmd, substitute(a:action, '\s*$', '', ''))

    " Transform literal keycodes
    let kcodes = substitute(a:cmd, kcode, '\=eval("\"\\".submatch(0)."\"")', '')

    " Create help command
    let help = substitute(a:help, '\(.\)', ":help \\1\<CR>", '')

    call add(g:recipes_list, cmd)
    let g:recipes_cmds[cmd] = {'keycode': kcodes, 'help': a:help}
endf

""""""""
" Public
""""""""

function! recipes#init()
endf

function! recipes#add(bang, args)

    let args = []
    let pat_single = "'([^']|'')*'"
    let pat_double = '"([^"\]|\.)*"'
    let pat = '\v(' . pat_single . '|' . pat_double . ')'

    call substitute(a:args, pat, '\=add(args, eval(submatch(0)))', 'g')

    if match(args, '^\s*$') >= 0 || len(args) / 2 != 1
        echoerr s:error
        return
    endif

    call s:add(a:bang, args[0], args[1], get(args, 2, ''))
endf

""""""""""
" Commands
""""""""""

autocmd FileType recipes.vim setlocal noet sw=4 ts=4 sts=4 enc=utf-8 so=0

command! -nargs=+ -bang Recipe call recipes#add('!' == '<bang>', <q-args>)
