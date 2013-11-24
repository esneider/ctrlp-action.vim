if exists('b:current_syntax')
    finish
endif

syntax match recipesBody     '\v^\S.*$'        transparent contains=recipesCommand,recipesAction
syntax match recipesAction   '\v\t.*$'           contained contains=recipesCategory,recipesMarker
syntax match recipesCommand  '\v^\S[^\t]*'       contained contains=recipesCmdLine,recipesKeycode,recipesSpace,recipesCR
syntax match recipesCmdLine  '\v^\>'             contained contains=NONE
syntax match recipesKeycode  '\v\<\w(\w|-)*\w\>' contained contains=NONE
syntax match recipesSpace    '\v\S\zs \ze\t'     contained contains=NONE
syntax match recipesCategory '\v[^:]*:'          contained contains=NONE

let recipesCR  = 'syntax match recipesCR ''\v'
let recipesCR .= g:recipes_opts.cr_char
let recipesCR .= '\ze\t'' contained contains=NONE'
execute recipesCR

let recipesMarker  = 'syntax match recipesMarker '''
let recipesMarker .= g:recipes_opts.mrk_ptr
let recipesMarker .= ''' contained contains=NONE'
execute recipesMarker

silent! highlight recipesInvisible guifg=bg ctermfg=bg
silent! highlight recipesCategory  gui=bold cterm=bold
silent! highlight recipesSpace     gui=underline cterm=underline

highlight link recipesAction  Normal
highlight link recipesCommand Comment
highlight link recipesKeycode Normal
highlight link recipesMatch   Constant
highlight link recipesCmdLine recipesInvisible
highlight link recipesMarker  recipesInvisible

let b:current_syntax = "recipes.vim"
