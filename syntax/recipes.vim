if exists('b:current_syntax')
    finish
endif

syntax match recipesBody     '\v^\S.*$'        transparent           contains=recipesCommand,recipesAction
syntax match recipesAction   '\v\t.*$'                     contained contains=recipesCategory,recipesMarker
syntax match recipesCommand  '\v^\S[^\t]*'                 contained contains=recipesCmdLine,recipesKeycode,recipesSpace,recipesCR
syntax match recipesCmdLine  '\v^\>'                       contained contains=NONE
syntax match recipesKeycode  '\v\<([CSATMcsatm]-)*\w+\>'   contained contains=recipesCR
syntax match recipesSpace    '\v\S\zs \ze\t'               contained contains=NONE
syntax match recipesCR       '\v↩\ze\t'                    contained contains=NONE
syntax match recipesCategory '\v[^:]*:'                    contained contains=NONE

let recipesMarker  = 'syntax match recipesMarker '''
let recipesMarker .= g:recipes_mrk_ptr
let recipesMarker .= ''' contained contains=NONE'
execute recipesMarker

highlight      recipesInvisible guifg=bg ctermfg=bg
highlight link recipesAction    Normal
highlight link recipesCommand   Comment
highlight link recipesKeycode   Normal
highlight link recipesSpace     SpellBad
highlight link recipesCategory  Title
highlight link recipesMatch     Constant
highlight link recipesCmdLine   recipesInvisible
highlight link recipesMarker    recipesInvisible

let b:current_syntax = "recipes.vim"
