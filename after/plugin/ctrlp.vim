if !exists('g:loaded_ctrlp') || !g:loaded_ctrlp
  finish
endif

let s:save_cpo = &cpo
set cpo&vim

" This is a hack to change the default matcher just for this ctrlp-extension,
" without changing the global matcher.
" The only drawback is that when the plugin is opened via another
" ctrlp-extension, we have to fall-back to the ctrlp file matcher.
function! s:recipes()

    let matcher = get(g:, 'ctrlp_match_func', {})
    let g:ctrlp_match_func = {'match': 'ctrlp#recipes#matcher#match'}
    call ctrlp#init(ctrlp#recipes#id())
    let g:ctrlp_match_func = matcher
endf

command! CtrlPRecipes call s:recipes()

let &cpo = s:save_cpo
unlet s:save_cpo
