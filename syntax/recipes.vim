if exists('b:current_syntax')
    finish
endif

syntax match recipesBody     '\v^\S.*$'        transparent           contains=recipesCommand,recipesAction
syntax match recipesAction   '\v\t.*$'         transparent contained contains=recipesCategory,recipesBrief
syntax match recipesCommand  '\v^\S[^\t]*'                 contained contains=recipesKeycode,recipesSpace
syntax match recipesKeycode  '\v\<([CSATMcsatm]-)*\w+\>'   contained contains=recipesCR
syntax match recipesCR       '\v\<[Cc][Rr]\>\ze\t' conceal contained contains=NONE
syntax match recipesSpace    '\v \ze\t'            conceal contained contains=NONE
syntax match recipesBrief    '\v.*$'                       contained contains=NONE
syntax match recipesCategory '\v[^:]*:'                    contained contains=NONE
syntax match recipesComment  '\v^\s+##.*##\s*$'

highlight link recipesCommand  Comment
highlight link recipesSpace    SpellBad
highlight link recipesKeycode  Normal
highlight link recipesBrief    Normal
highlight link recipesCategory Title
highlight link recipesComment  Special

let b:current_syntax = "recipes"
