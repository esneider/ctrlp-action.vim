autocmd BufNewFile,BufRead recipes.txt set filetype=recipes.txt
autocmd FileType recipes.txt setlocal noexpandtab sw=4 ts=4 sts=4 encoding=utf-8
autocmd FileType recipes.txt if has('conceal') | setlocal conceallevel=2 | endif
