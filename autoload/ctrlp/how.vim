if exists('g:loaded_ctrlp_how') && g:loaded_ctrlp_how
    finish
endif

let g:loaded_ctrlp_how = 1

call add(g:ctrlp_ext_vars, {
    \ 'init': 'ctrlp#how#init()',
    \ 'accept': 'ctrlp#how#accept',
    \ 'lname': 'how',
    \ 'sname': 'how',
    \ 'type': 'line',
    \ 'sort': 1,
    \ 'nolim': 1,
    \ })

let s:id = g:ctrlp_builtins + len(g:ctrlp_ext_vars)

let s:how_path = expand("<sfile>:p:h") . "/hows.txt"
let s:how_list = readfile(s:how_path)

if exists("g:how_list")
    call extend(s:how_list, g:how_list)
endif

function! ctrlp#how#init()
    return s:how_list
endfunction

function! ctrlp#how#accept(mode, choice)
    call ctrlp#exit()
    let cmd = split(a:choice, '\t')[0]

    if cmd[0] == ':'
        cmd .= '\n'
    endif

    call feedkeys(cmd)
endfunction

function! ctrlp#how#id()
    return s:id
endfunction

