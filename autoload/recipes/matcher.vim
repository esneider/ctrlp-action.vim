""""""""""""
" Load guard
""""""""""""

if exists('g:loaded_recipes_matcher') && g:loaded_recipes_matcher
    finish
endif

let g:loaded_recipes_matcher = 1

"""""""
" Utils
"""""""

function! s:highlight_list(start, list, end_marker, append)

    let rlist = [''] + a:list + ['']

    for i in range(len(a:list))

        " ['' | 0 .. i ][ i+1 ][ i+2 .. -1 | '']
        "      first     middle      last

        let first = join(rlist[       : (i) ], '\.\{-}' . a:append)
        let last  = join(rlist[ (i+2) :     ], '\.\{-}' . a:append)

        let middle  = '\.\{-}\zs' . rlist[ (i+1) ] . '\ze\.\{-}' . a:append
        let pattern = a:start . (first . middle . last)[ : (-1-len(a:append)) ]

        call matchadd('recipesMatch', pattern . '\.\*' . a:end_marker . '\$')
    endfor
endf

function! s:highlight(start, pattern, markers)

    call clearmatches()

    let start = a:start . '\^\[^\t]\*\t\.\{-}'

    call s:highlight_list(start, split(a:pattern, '\zs'), a:markers[2], '')
    call s:highlight_list(start, split(a:pattern, '\s'),  a:markers[1], '\<')

    call matchadd('recipesMatch', start . '\zs' . a:pattern . '\ze\.\*' . a:markers[0] . '\$')
endf

function! s:sort_cmp(a, b)

    return a:a[1] - a:b[1]
endf

function! s:matchlist(start, list, word, action)

    let gaps = 0
    let max  = 0
    let pos  = 0

    for token in a:list

        " Match next token
        let npos = match(a:action, a:start . a:word . token, pos)
        if npos < 0 | return -1 | endif

        " Count non white gaps
        let max   = max ? max : npos - pos
        let gaps += (pos < npos) && (a:action[(pos):(npos-1)] =~ '\S')
        let pos   = npos + len(token)
    endfor

    return 10 * gaps + max
endf

""""""""
" Public
""""""""

" 0. We match the pattern exactly, and append g:recipes_opts.markers[0].
" 1. We match by word beginnings, and append g:recipes_opts.markers[1].
" 2. We match any increasing subsequence and append g:recipes_opts.markers[2].
function! recipes#matcher#match(lines, input, limit, mmode, ispath, crfile, regex)

    let lines   = []
    let markers = g:recipes_opts.markers
    let letters = split(a:input, '\zs')
    let words   = split(a:input, '\s')
    let start   = '\V' . (&scs && a:input =~ '\u' ? '\C' : '\c')

    for line in a:lines

        let line   = substitute(line, g:recipes_opts.mrk_ptr, '', '')
        let action = split(line, '\t')[1]
        let gaps   = s:matchlist(start, letters, '', action)

        if gaps >= 0

            let pos = match(action, start . a:input)
            let match = 0

            if pos < 0

                let match = 2
                let pos   = gaps
                let gaps  = s:matchlist(start, words, '\<', action)

                if gaps >= 0

                    let match = 1
                    let pos = gaps
                endif
            endif

            let score = 1000 * match + 2 * len(action) + pos

            call add(lines, [line . markers[match], score])
        endif
    endfor

    call sort(lines, 's:sort_cmp')
    call s:highlight(start, a:input, markers)

    return map(lines, 'v:val[0]')
endf

