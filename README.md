![HEADER IMAGE](https://github.com/theamallalgi/zitchdog.vim/blob/main/dependencies/header.png?raw=true)
# Zitchdog.vim
A Vim port of the [zitchdog](https://github.com/theamallalgi/zitchdog) color scheme for Neovim.

>[!NOTE]
> This color scheme comes in three variants: `night`, `grape`, and `pine`.

## Installation

You can install this color scheme using your favorite Vim plugin manager.

### Vundle

```vim
Plugin 'theamallalgi/zitchdog.vim'
```

### Pathogen

```bash
git clone https://github.com/theamallalgi/zitchdog.vim.git ~/.vim/bundle/zitchdog.vim
```

### vim-plug

```vim
Plug 'theamallalgi/zitchdog.vim'
```

## Usage

To use the color scheme, add the following to your `.vimrc` file:

```vim
" Set the color scheme
colorscheme zitchdog
```

To select a variant, set the `g:zitchdog_style` variable before loading the color scheme. The available options are `night`, `grape`, and `pine`.

```vim
" Choose a variant (e.g., 'grape')
let g:zitchdog_style = 'grape'

" Set the color scheme
colorscheme zitchdog
```
