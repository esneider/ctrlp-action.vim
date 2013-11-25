# recipes.vim


It's often said that you never stop learning Vim. So, why not optimize the
learning process? Learn by being productive.


## What?


Think in terms of what you want, not how you want it done.

*recipes.vim* will let you explore common actions (recipes) you'd want to do in
Vim, specially while editing code. It simply provides the ability to fuzzy
search (`:CtrlPRecipes`) for a recipe description, execute it (Enter), while
learning the command for it, and even being able to open related help (Ctrl-t,
Ctrl-v, Ctrl-h).


## Example


Search for 'toggle case':

```
V~    Toggle case of current line
viw~  Toggle case of current word
```


## Installing it


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

If you don't have a package manager, you probably should...
[Go](https://github.com/gmarik/vundle)


## Using it


```vim
:CtrlPRecipes
```

You can add a mapping to your *vimrc*

## Extending it

TODO

