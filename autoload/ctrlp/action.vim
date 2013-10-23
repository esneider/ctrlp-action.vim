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

function! ctrlp#action#init()
    return readfile(s:action_path)

endfunction

function! ctrlp#action#accept(mode, choice)
  call ctrlp#exit()
  " call feedkeys(':')
  call feedkeys(split(a:choice, '\t')[0] . "\n")
endfunction

function! ctrlp#action#id()
	return s:id
endfunction

