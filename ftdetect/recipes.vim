autocmd BufNewFile,BufRead recipes.txt set filetype=recipes

autocmd FileType recipes setlocal noexpandtab sw=4 ts=4 sts=4
autocmd FileType recipes if has('conceal') | setlocal conceallevel=2 | endif
