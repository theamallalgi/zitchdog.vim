# zitchdog.vim

A Vim port of the [zitchdog](https://github.com/zitchdog/zitchdog.nvim) color scheme for Neovim.

This color scheme comes in three variants: `night`, `grape`, and `pine`.

## Installation

You can install this color scheme using your favorite Vim plugin manager.

### Vundle

```vim
Plugin 'zitchdog/zitchdog.vim'
```

### Pathogen

```bash
git clone https://github.com/zitchdog/zitchdog.vim.git ~/.vim/bundle/zitchdog.vim
```

### vim-plug

```vim
Plug 'zitchdog/zitchdog.vim'
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

**Note:** The `night` variant is based on the `tokyonight.vim` color scheme, which is included in this repository.