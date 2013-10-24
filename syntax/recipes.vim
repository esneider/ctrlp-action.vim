if exists('b:current_syntax')
    finish
endif

syntax match recipesBody     '\v^\S.*$'        transparent           contains=recipesCommand,recipesAction
syntax match recipesAction   '\v\t.*$'         transparent contained contains=recipesCategory,recipesBrief
syntax match recipesCommand  '\v^\S[^\t]*'                 contained contains=recipesNonSpace,recipesSpace
syntax match recipesSpace    '\v '                         contained contains=NONE
syntax match recipesNonSpace '\v^[^\t]*[^ \t]' transparent contained contains=NONE
syntax match recipesBrief    '\v.*$'                       contained contains=NONE
syntax match recipesCategory '\v[^:]*:'                    contained contains=NONE
syntax match recipesComment  '\v^\s+##.*##\s*$'

highlight link recipesCommand  Comment
highlight link recipesSpace    SpellBad
highlight link recipesBrief    Normal
highlight link recipesCategory Question
highlight link recipesComment  Special

let b:current_syntax = "recipes"
