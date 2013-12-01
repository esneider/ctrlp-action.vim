# Recipes.vim

It's often said that you never stop learning Vim. So why not optimize the
learning process?

*Learn Vim while being productive™*

Recipes.vim will let you explore common actions (recipes) you might want to do
in Vim, specially while editing code.

![](http://i.imgur.com/UivnA3M.png)

## How?

You can fuzzy search for a recipe description and execute it, while learning
the command for it and being able to open related help.

Running `:CtrlPRecipes` will open the recipe browser. Once there, you can type:
* **any text**, to narrow down the search.
* **enter**, to execute the selected recipe.
* **escape**, to close the recipe browser.
* **up** and **down arrows**, to move through the matching recipes.
* **ctrl-t**, **ctrl-v** and **ctrl-h**, to open the related help section for
  the selected recipe (in a new tab, vertical or horizontal split,
  respectively).

## Install

Since Recipes.vim is a CtrlP extension, you will also need to install
[CtrlP](https://github.com/kien/ctrlp.vim).

If you are using [vundle](https://github.com/gmarik/vundle), just add this to
your vimrc:

```
Bundle 'kien/ctrlp.vim'
Bundle 'esneider/recipes.vim'
```

If you are using [pathogen](https://github.com/tpope/vim-pathogen), do:

```
cd ~/.vim/bundle
git clone https://github.com/kien/ctrlp.vim
git clone https://github.com/esneider/recipes.vim
```

You might want to add a mapping in your vimrc to `:CtrlPRecipes` for quicker
access, like:

```
nnoremap <Leader>r :CtrlPRecipes<CR>
```

## Credits

Inspired by [Sublime Text 2](http://www.sublimetext.com/2) Command Palette.

Made possible by the awesome [CtrlP](https://github.com/kien/ctrlp.vim).

