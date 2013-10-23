if exists('g:loaded_ctrlp_action') && g:loaded_ctrlp_action
	finish
endif

let g:loaded_ctrlp_action = 1

call add(g:ctrlp_ext_vars, {
	\ 'init': 'ctrlp#action#init()',
	\ 'accept': 'ctrlp#action#accept',
	\ 'lname': 'action',
	\ 'sname': 'act',
	\ 'type': 'line',
	\ 'sort': 0,
	\ 'nolim': 1,
	\ })

let s:id = g:ctrlp_builtins + len(g:ctrlp_ext_vars)

let s:action_path = expand("<sfile>:p:h") . "/actions.txt"
let s:action_list = readfile(s:action_path)

if exists("g:action_list")
    call extend(s:action_list, g:action_list)
endif

function! ctrlp#action#init()
    return s:action_list
endfunction

function! ctrlp#action#accept(mode, choice)
    call ctrlp#exit()
    " call feedkeys(':')
    let cmd = split(a:choice, '\t')[0]

    if cmd[0] == ':'
        cmd .= '\n'
    endif

    call feedkeys(cmd)
endfunction

function! ctrlp#action#id()
	return s:id
endfunction

