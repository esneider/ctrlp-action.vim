if exists('g:loaded_recipes') && g:loaded_recipes
    finish
endif

let g:loaded_recipes = 1
let g:recipes_opts   = {
\   'cmd_len': get(g:, 'recipes_cmd_len', 11),
\   'cr_char': get(g:, 'recipes_cr_char', '↩'),
\   'markers': ['  ', '. ', ', '],
\   'cmd_list': [],
\   'cmd_dict': {},
\}
let g:recipes_opts.mrk_ptr = '\V\(' . join(g:recipes_opts.markers, '\|') . '\)\$'

function! recipes#load()
endf

command! -bar CtrlPRecipes
\   call recipes#ctrlp#open()

command! -nargs=+ -bang Recipe
\   call recipes#add_recipe(expand('<sfile>:p'), expand('<slnum>'), '<bang>', <q-args>)

command! -nargs=? RecipeSection
\   call recipes#add_section(expand('<sfile>:p'), expand('<slnum>'), <q-args>)

