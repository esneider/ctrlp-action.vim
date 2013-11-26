# recipes.vim

It's often said that you never stop learning Vim. So, why not optimize the
learning process? Learn while being productive.

## What?

Think in terms of what you want, not how you want it done.

[screencast]

recipes.vim will let you explore common actions (recipes) you might want to do
in Vim, specially while editing code.

## How?

You can fuzzy search (`:CtrlPRecipes`) for a recipe description, and execute it
(*Enter*), while learning the command for it, and even being able to open
related help (*Ctrl-t*, *Ctrl-v*, *Ctrl-h*).

### Commands

Running `:CtrlPRecipes` will open the recipe browser. You might want to add a
mapping for quicker access, like `nnoremap <Leader>r :CtrlPRecipes<CR>`

Once there, you can type:
* any text, to refine the search
* *up* and *down* arrows, to move through the matching recipes
* *enter*, to run the selected recipe
* *Ctrl-t*, *Ctrl-v* and *Ctrl-h*, to open the related help section in a new
  tab, in a vertical or horizontal split, respectively

## Install!

Since *recipes.vim* is a CtrlP extension, you will also need to install
[it](kien/ctrlp.vim).

If you are using [vundle](https://github.com/gmarik/vundle), just add this to
your *vimrc*:

```vim
Bundle 'kien/ctrlp.vim'
Bundle 'esneider/recipes.vim'
```

If you are using [pathogen](https://github.com/tpope/vim-pathogen/), do:

```bash
cd ~/.vim/bundle
git clone https://github.com/gmarik/vundle
git clone https://github.com/esneider/recipes.vim
```

