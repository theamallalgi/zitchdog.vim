<img width="1400" height="784" alt="header" src="https://github.com/user-attachments/assets/7f06bada-0d73-4a1d-9d98-8e08ddbc9294" />

# Zitchdog.vim

A Vim port of the [theamallalgi/zitchdog](https://github.com/theamallalgi/zitchdog) color scheme for Neovim.  
Just like in Neovim, this vim-port comes in two variants: `grape` and `pine`.

> [!NOTE]
> This repository is generated automatically from the Neovim theme. Every change to [theamallalgi/zitchdog](https://github.com/theamallalgi/zitchdog) is converted and pushed here by a GitHub Action, and the files in `colors/` and `autoload/` are overwritten on each sync. We do not edit them by hand. To change a color or a highlight group, open an issue or pull request on the [Neovim repo](https://github.com/theamallalgi/zitchdog), but are there really anymore Vim users left?

<img width="1920" height="1080" alt="banner" src="https://github.com/user-attachments/assets/2d50d0e8-ceb5-4502-8448-3d9837a5e3d8" />

## Installation

You can install this color scheme using your favorite Vim plugin manager.

#### Install using [vundlevim/vundle](https://github.com/vundlevim/vundle.vim)

```vim
Plugin 'theamallalgi/zitchdog.vim'
```

#### Install using [tpope/vim-pathogen](https://github.com/tpope/vim-pathogen)

```bash
git clone https://github.com/theamallalgi/zitchdog.vim.git ~/.vim/bundle/zitchdog.vim
```

#### Install using [junegunn/vim-plug](https://github.com/junegunn/vim-plug)

```vim
Plug 'theamallalgi/zitchdog.vim'
```

## Usage

To use the color scheme, add the following to your `.vimrc` file:

```vim
" Set the color scheme (defaults to grape)
colorscheme zitchdog
```

To select a variant, set the `g:zitchdog_style` variable before loading the color scheme. The available options are `grape` and `pine`.

```vim
" Choose a variant (e.g., 'pine')
let g:zitchdog_style = 'pine'

" Set the color scheme
colorscheme zitchdog
```

You can also load a variant directly:

```vim
colorscheme zitchdog-pine
```

## Options

Set these before loading the color scheme.

| Variable | Default | Description |
| --- | --- | --- |
| `g:zitchdog_style` | `'grape'` | Variant used by `colorscheme zitchdog`: `'grape'` or `'pine'` |
| `g:zitchdog_transparent_background` | `0` | Set to `1` to use your terminal background |
| `g:zitchdog_italic_comments` | `0` | Set to `1` to render comments in italics |

## Lightline

Matching lightline themes are included:

```vim
let g:lightline = { 'colorscheme': 'zitchdog_grape' }
" or
let g:lightline = { 'colorscheme': 'zitchdog_pine' }
```

### Screenshots

| The `Grape` Variant | The `Pine` Variant |
|:---:|:---:|
| <img width="400" src="https://github.com/user-attachments/assets/1041e587-a497-4609-9ed8-e7fb12a89957" alt="grape" /> | <img width="400" src="https://github.com/user-attachments/assets/1e847e42-d4b3-4200-a902-f9ff1a806807" alt="pine" /> |
