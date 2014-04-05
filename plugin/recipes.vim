" File:
"   recipes.vim
"
" Commands for the user, both for creating recipes and recipes sections, and
" for invoking the CtrlP extension.

if exists('g:loaded_recipes') && g:loaded_recipes
    finish
endif

let g:loaded_recipes = 1

" Global plugin variables.
let g:recipes_opts = {
\   'cmd_len': get(g:, 'recipes_cmd_len', 11),
\   'cr_char': get(g:, 'recipes_cr_char', '↩'),
\   'markers': ['  ', '. ', ', ', '` '],
\   'cmd_list': [],
\   'cmd_dict': {},
\}

let g:recipes_opts.mrk_ptr = '\V\(' . join(g:recipes_opts.markers, '\|') . '\)\$'

" Recipe browser command.
command -bar CtrlPRecipes
\   call recipes#ctrlp#open()

" Command to add a new recipe.
command -nargs=+ -bang Recipe
\   call recipes#add_recipe(expand('<sfile>:p'), expand('<slnum>'), '<bang>', <q-args>)

" Command to add a new recipes section.
command -nargs=? RecipeSection
\   call recipes#add_section(expand('<sfile>:p'), expand('<slnum>'), <q-args>)

