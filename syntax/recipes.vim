if exists('b:current_syntax')
    finish
endif

syntax match recipesBody     '\v^\S.*$'        transparent           contains=recipesCommand,recipesAction
syntax match recipesAction   '\v\t.*$'                     contained contains=recipesCategory
syntax match recipesCommand  '\v^\S[^\t]*'                 contained contains=recipesCmdLine,recipesKeycode,recipesSpace,recipesCR
syntax match recipesCmdLine  '\v^\>'                       contained contains=NONE
syntax match recipesKeycode  '\v\<([CSATMcsatm]-)*\w+\>'   contained contains=recipesCR
syntax match recipesSpace    '\v\S\zs \ze\t'               contained contains=NONE
syntax match recipesCR       '\v↩\ze\t'                    contained contains=NONE
syntax match recipesCategory '\v[^:]*:'                    contained contains=NONE

highlight link recipesAction   Normal
highlight link recipesCommand  Comment
highlight link recipesKeycode  Normal
highlight link recipesSpace    SpellBad
highlight link recipesCategory Title
highlight link recipesMatch    Constant
highlight      recipesCmdLine  guifg=bg ctermfg=bg

let b:current_syntax = "recipes.vim"
