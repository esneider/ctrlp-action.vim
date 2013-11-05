# Vim recipes for humans

## What?

`recipes` exposes common commands and use cases in natural
language.

Never again lose time and focus in googling commands you'll
come to forget.

Think in terms of what you want, not how you want it done.


## Example

Search for 'toggle case':

```
V~    Toggle case of current line
viw~  Toggle case of current word
```


## Install

```vim
Bundle 'esneider/recipes.vim'
```


## Use

```vim
:CtrlPRecipes
```

We recommend using Ctrl+Shift+P as a binding


## Extend

You can define your own _recipes_ by declaring a `g:ctrlp_recipes` array of strings. Each of these strings should be in the form of `<command>\t<description>`.

    let g:action_list = ["gg	Go to the beginning of the buffer"]
