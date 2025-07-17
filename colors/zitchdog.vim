" -----------------------------------------------------------------------------
" Name:         zitchdog
" Description:  A port of the zitchdog neovim theme to vim.
" Author:       Your Name
" Website:      
" License:      MIT
" -----------------------------------------------------------------------------

" Initialization: {{{
highlight clear
if exists('syntax_on')
  syntax reset
endif
set background=dark

let s:t_Co = exists('&t_Co') && !empty(&t_Co) && &t_Co > 1 ? &t_Co : 2
let s:tmux = executable('tmux') && $TMUX !=# ''

let g:colors_name = 'zitchdog'
" }}}
" Configuration: {{{
let s:configuration = {}
let s:configuration.style = get(g:, 'zitchdog_style', 'night')
let s:configuration.transparent_background = get(g:, 'zitchdog_transparent_background', 0)
let s:configuration.menu_selection_background = get(g:, 'zitchdog_menu_selection_background', 'green')
let s:configuration.disable_italic_comment = get(g:, 'zitchdog_disable_italic_comment', 0)
let s:configuration.enable_italic = get(g:, 'zitchdog_enable_italic', 0)
let s:configuration.cursor = get(g:, 'zitchdog_cursor', 'auto')
let s:configuration.current_word = get(g:, 'zitchdog_current_word', get(g:, 'zitchdog_transparent_background', 0) == 0 ? 'grey background' : 'bold')
" }}}
" Palette: {{{
"
if s:configuration.style ==# 'night'
  let s:palette = {
        \ 'purple':     ['#a277ff', '141', 'Magenta'],
        \ 'green':      ['#61ffca', '84', 'Green'],
        \ 'orange':     ['#ffca85', '215', 'Orange'],
        \ 'coral':      ['#ff7b7b', '210', 'Red'],
        \ 'cyan':       ['#26f9eb', '117', 'Cyan'],
        \ 'red':        ['#ff6767', '203', 'Red'],
        \ 'pink':       ['#f694ff', '212', 'Magenta'],
        \ 'white':      ['#f6ceff', '253', 'White'],
        \ 'gray':       ['#6d6d6d', '242', 'DarkGrey'],
        \ 'ash':        ['#29263c', '237', 'DarkGrey'],
        \ 'black':      ['#15141b', '235', 'Black'],
        \ 'darkblack':  ['#131218', '233', 'Black'],
        \ 'magenta':    ['#a277ff', '216', 'Orange'],
        \ 'yellow':     ['#ffca85', '222', 'Yellow'],
        \ 'mauve':      ['#3d375e', '237', 'DarkGrey'],
        \ 'blue':       ['#82e2ff', '111', 'Blue'],
        \ 'charcoal':   ['#15141b', '236', 'DarkGrey'],
        \ 'slate':      ['#542a91', '239', 'Grey'],
        \ 'graphite':   ['#272045', '240', 'Grey'],
        \ 'lilac':      ['#776eae', '183', 'Magenta'],
        \ 'amethyst':   ['#333352', '141', 'Magenta'],
        \ 'aubergine':  ['#232338', '59', 'DarkMagenta'],
        \ 'ebony':      ['#12121c', '235', 'Black'],
        \ 'maroon':     ['#652929', '52', 'DarkRed'],
        \ 'pine':       ['#123127', '22', 'DarkGreen'],
        \ 'indigo':     ['#345a65', '17', 'DarkBlue'],
        \ 'umber':      ['#4b3b27', '58', 'DarkRed'],
        \ 'clay':       ['#4b2424', '52', 'DarkYellow'],
        \ 'mulberry':   ['#433e62', '53', 'DarkMagenta'],
        \ 'teal':       ['#0e5e59', '23', 'DarkCyan'],
        \ 'lightblack': ['#1a1b26', '237', 'DarkGrey'],
        \ 'none':       ['NONE', 'NONE', 'NONE']
        \ }
elseif s:configuration.style ==# 'grape'
  let s:palette = {
        \ 'purple':     ['#8543e4', '99', 'Magenta'],
        \ 'green':      ['#46cda8', '43', 'Green'],
        \ 'cyan':       ['#17c5cb', '44', 'Cyan'],
        \ 'orange':     ['#e39069', '173', 'Orange'],
        \ 'coral':      ['#e4465d', '161', 'Red'],
        \ 'red':        ['#e4384c', '161', 'Red'],
        \ 'pink':       ['#d95be2', '170', 'Magenta'],
        \ 'white':      ['#db94e3', '176', 'White'],
        \ 'gray':       ['#513b50', '53', 'DarkGrey'],
        \ 'ash':        ['#191324', '234', 'DarkGrey'],
        \ 'black':      ['#0d0910', '232', 'Black'],
        \ 'mauve':      ['#281a42', '235', 'DarkGrey'],
        \ 'blue':       ['#64aae2', '75', 'Blue'],
        \ 'yellow':     ['#e09066', '173', 'Yellow'],
        \ 'magenta':    ['#8443e4', '99', 'Orange'],
        \ 'charcoal':   ['#0d0910', '232', 'DarkGrey'],
        \ 'slate':      ['#542a91', '55', 'Grey'],
        \ 'graphite':   ['#272045', '235', 'Grey'],
        \ 'lilac':      ['#5a3c8d', '61', 'Magenta'],
        \ 'amethyst':   ['#201638', '234', 'Magenta'],
        \ 'aubergine':  ['#150f25', '233', 'DarkMagenta'],
        \ 'ebony':      ['#09080e', '232', 'Black'],
        \ 'maroon':     ['#481219', '52', 'DarkRed'],
        \ 'pine':       ['#0b1618', '233', 'DarkGreen'],
        \ 'indigo':     ['#212f4a', '235', 'DarkBlue'],
        \ 'umber':      ['#331b17', '234', 'DarkRed'],
        \ 'clay':       ['#331016', '52', 'DarkYellow'],
        \ 'mulberry':   ['#2e1d46', '235', 'DarkMagenta'],
        \ 'teal':       ['#08313f', '23', 'DarkCyan'],
        \ 'lightblack': ['#100d17', '233', 'DarkGrey'],
        \ 'darkblack':  ['#0b080e', '232', 'Black'],
        \ 'none':       ['NONE', 'NONE', 'NONE']
        \ }
else
  let s:palette = {
        \ 'purple':     ['#844364', '96', 'Magenta'],
        \ 'green':      ['#46914d', '29', 'Green'],
        \ 'cyan':       ['#188e5c', '30', 'Cyan'],
        \ 'orange':     ['#e47833', '166', 'Orange'],
        \ 'coral':      ['#e4462f', '161', 'Red'],
        \ 'red':        ['#e43728', '160', 'Red'],
        \ 'pink':       ['#da5b64', '161', 'Magenta'],
        \ 'white':      ['#da7a64', '167', 'White'],
        \ 'gray':       ['#513c2a', '52', 'DarkGrey'],
        \ 'ash':        ['#191219', '233', 'DarkGrey'],
        \ 'black':      ['#0d0910', '232', 'Black'],
        \ 'mauve':      ['#281b24', '234', 'DarkGrey'],
        \ 'blue':       ['#658265', '65', 'Blue'],
        \ 'yellow':     ['#e37832', '166', 'Yellow'],
        \ 'magenta':    ['#834264', '96', 'Orange'],
        \ 'charcoal':   ['#0d0910', '232', 'DarkGrey'],
        \ 'slate':      ['#542a91', '55', 'Grey'],
        \ 'graphite':   ['#272045', '235', 'Grey'],
        \ 'lilac':      ['#5a3b42', '52', 'Magenta'],
        \ 'amethyst':   ['#201520', '233', 'Magenta'],
        \ 'aubergine':  ['#151019', '233', 'DarkMagenta'],
        \ 'ebony':      ['#0a090f', '232', 'Black'],
        \ 'maroon':     ['#481214', '52', 'DarkRed'],
        \ 'pine':       ['#0a1613', '233', 'DarkGreen'],
        \ 'indigo':     ['#212e27', '235', 'DarkBlue'],
        \ 'umber':      ['#321c12', '234', 'DarkRed'],
        \ 'clay':       ['#331011', '52', 'DarkYellow'],
        \ 'mulberry':   ['#2d1e26', '234', 'DarkMagenta'],
        \ 'teal':       ['#083122', '22', 'DarkCyan'],
        \ 'lightblack': ['#100d17', '233', 'DarkGrey'],
        \ 'darkblack':  ['#0b080e', '232', 'Black'],
        \ 'none':       ['NONE', 'NONE', 'NONE']
        \ }
endif

" }}}
" Function: {{{
" call s:HL(group, foreground, background)
" call s:HL(group, foreground, background, gui, guisp)
"
" E.g.:
" call s:HL('Normal', s:palette.white, s:palette.black)

if (has('termguicolors') && &termguicolors) || has('gui_running')  " guifg guibg gui cterm guisp
  function! s:HL(group, fg, bg, ...)
    let hl_string = [
          \ 'highlight', a:group,
          \ 'guifg=' . a:fg[0],
          \ 'guibg=' . a:bg[0],
          \ ]
    if a:0 >= 1
      if a:1 ==# 'undercurl'
        if !s:tmux
          call add(hl_string, 'gui=undercurl')
        else
          call add(hl_string, 'gui=underline')
        endif
        call add(hl_string, 'cterm=underline')
      else
        call add(hl_string, 'gui=' . a:1)
        call add(hl_string, 'cterm=' . a:1)
      endif
    else
      call add(hl_string, 'gui=NONE')
      call add(hl_string, 'cterm=NONE')
    endif
    if a:0 >= 2
      call add(hl_string, 'guisp=' . a:2[0])
    endif
    execute join(hl_string, ' ')
  endfunction
elseif s:t_Co >= 256  " ctermfg ctermbg cterm
  function! s:HL(group, fg, bg, ...)
    let hl_string = [
          \ 'highlight', a:group,
          \ 'ctermfg=' . a:fg[1],
          \ 'ctermbg=' . a:bg[1],
          \ ]
    if a:0 >= 1
      if a:1 ==# 'undercurl'
        call add(hl_string, 'cterm=underline')
      else
        call add(hl_string, 'cterm=' . a:1)
      endif
    else
      call add(hl_string, 'cterm=NONE')
    endif
    execute join(hl_string, ' ')
  endfunction
else  " ctermfg ctermbg cterm
  function! s:HL(group, fg, bg, ...)
    let hl_string = [
          \ 'highlight', a:group,
          \ 'ctermfg=' . a:fg[2],
          \ 'ctermbg=' . a:bg[2],
          \ ]
    if a:0 >= 1
      if a:1 ==# 'undercurl'
        call add(hl_string, 'cterm=underline')
      else
        call add(hl_string, 'cterm=' . a:1)
      endif
    else
      call add(hl_string, 'cterm=NONE')
    endif
    execute join(hl_string, ' ')
  endfunction
endif
" }}}

" Common Highlight Groups: {{{
" UI: {{{
if s:configuration.transparent_background
  call s:HL('Normal', s:palette.white, s:palette.none)
  call s:HL('Terminal', s:palette.white, s:palette.none)
  call s:HL('EndOfBuffer', s:palette.black, s:palette.none)
  call s:HL('FoldColumn', s:palette.gray, s:palette.none)
  call s:HL('Folded', s:palette.gray, s:palette.none)
  call s:HL('SignColumn', s:palette.white, s:palette.none)
  call s:HL('ToolbarLine', s:palette.white, s:palette.none)
else
  call s:HL('Normal', s:palette.white, s:palette.black)
  call s:HL('Terminal', s:palette.white, s:palette.black)
  call s:HL('EndOfBuffer', s:palette.black, s:palette.black)
  call s:HL('FoldColumn', s:palette.gray, s:palette.black)
  call s:HL('Folded', s:palette.gray, s:palette.black)
  call s:HL('SignColumn', s:palette.white, s:palette.black)
  call s:HL('ToolbarLine', s:palette.white, s:palette.charcoal)
endif
call s:HL('ColorColumn', s:palette.none, s:palette.charcoal)
call s:HL('Conceal', s:palette.gray, s:palette.none)
if s:configuration.cursor ==# 'auto'
  call s:HL('Cursor', s:palette.none, s:palette.none, 'reverse')
elseif s:configuration.cursor ==# 'red'
  call s:HL('Cursor', s:palette.black, s:palette.red)
elseif s:configuration.cursor ==# 'green'
  call s:HL('Cursor', s:palette.black, s:palette.green)
elseif s:configuration.cursor ==# 'blue'
  call s:HL('Cursor', s:palette.black, s:palette.blue)
endif
highlight! link vCursor Cursor
highlight! link iCursor Cursor
highlight! link lCursor Cursor
highlight! link CursorIM Cursor
call s:HL('CursorColumn', s:palette.none, s:palette.charcoal)
call s:HL('CursorLine', s:palette.none, s:palette.charcoal)
call s:HL('LineNr', s:palette.amethyst, s:palette.none)
if &relativenumber == 1 && &cursorline == 0
  call s:HL('CursorLineNr', s:palette.lilac, s:palette.none)
else
  call s:HL('CursorLineNr', s:palette.lilac, s:palette.charcoal)
endif
call s:HL('DiffAdd', s:palette.green, s:palette.pine)
call s:HL('DiffChange', s:palette.blue, s:palette.indigo)
call s:HL('DiffDelete', s:palette.red, s:palette.maroon)
call s:HL('DiffText', s:palette.orange, s:palette.clay)
call s:HL('Directory', s:palette.green, s:palette.none, 'bold')
call s:HL('ErrorMsg', s:palette.red, s:palette.black, 'bold')
call s:HL('WarningMsg', s:palette.orange, s:palette.black, 'bold')
call s:HL('ModeMsg', s:palette.white, s:palette.none, 'bold')
call s:HL('MoreMsg', s:palette.blue, s:palette.none, 'bold')
call s:HL('IncSearch', s:palette.orange, s:palette.black, 'inverse')
call s:HL('Search', s:palette.black, s:palette.yellow)
call s:HL('MatchParen', s:palette.none, s:palette.black, 'bold')
call s:HL('NonText', s:palette.ash, s:palette.none)
call s:HL('Whitespace', s:palette.ash, s:palette.none)
call s:HL('SpecialKey', s:palette.white, s:palette.none)
call s:HL('Pmenu', s:palette.magenta, s:palette.black)
call s:HL('PmenuSbar', s:palette.none, s:palette.black)
if s:configuration.menu_selection_background ==# 'blue'
  call s:HL('PmenuSel', s:palette.magenta, s:palette.mulberry, 'bold')
  call s:HL('WildMenu', s:palette.blue, s:palette.black, 'bold')
elseif s:configuration.menu_selection_background ==# 'green'
  call s:HL('PmenuSel', s:palette.magenta, s:palette.mulberry, 'bold')
  call s:HL('WildMenu', s:palette.blue, s:palette.black, 'bold')
elseif s:configuration.menu_selection_background ==# 'red'
  call s:HL('PmenuSel', s:palette.magenta, s:palette.mulberry, 'bold')
  call s:HL('WildMenu', s:palette.blue, s:palette.black, 'bold')
endif
call s:HL('PmenuThumb', s:palette.none, s:palette.magenta)
call s:HL('Question', s:palette.yellow, s:palette.none)
call s:HL('SpellBad', s:palette.red, s:palette.none, 'undercurl', s:palette.red)
call s:HL('SpellCap', s:palette.orange, s:palette.none, 'undercurl', s:palette.orange)
call s:HL('SpellLocal', s:palette.blue, s:palette.none, 'undercurl', s:palette.blue)
call s:HL('SpellRare', s:palette.purple, s:palette.none, 'undercurl', s:palette.purple)
call s:HL('StatusLine', s:palette.purple, s:palette.black)
call s:HL('StatusLineTerm', s:palette.purple, s:palette.black)
call s:HL('StatusLineNC', s:palette.gray, s:palette.charcoal)
call s:HL('StatusLineTermNC', s:palette.gray, s:palette.charcoal)
call s:HL('TabLine', s:palette.gray, s:palette.black)
call s:HL('TabLineFill', s:palette.black, s:palette.black)
call s:HL('TabLineSel', s:palette.green, s:palette.black, 'inverse')
call s:HL('VertSplit', s:palette.black, s:palette.none)
call s:HL('Visual', s:palette.none, s:palette.mauve, 'inverse')
call s:HL('VisualNOS', s:palette.none, s:palette.mauve, 'inverse')
call s:HL('QuickFixLine', s:palette.blue, s:palette.none, 'bold')
call s:HL('Debug', s:palette.red, s:palette.none, 'bold')
call s:HL('debugPC', s:palette.black, s:palette.green)
call s:HL('debugBreakpoint', s:palette.black, s:palette.red)
call s:HL('ToolbarButton', s:palette.black, s:palette.blue)
if has('nvim')
  highlight! link healthError Red
  highlight! link healthSuccess Green
  highlight! link healthWarning Yellow
  highlight! link LspDiagnosticsError Red
  highlight! link LspDiagnosticsWarning Orange
  highlight! link LspDiagnosticsInformation Cyan
  highlight! link LspDiagnosticsHint Blue
  highlight! link LspReferenceText CocHighlightText
  highlight! link LspReferenceRead CocHighlightText
  highlight! link LspReferenceWrite CocHighlightText
endif
" 
" }}}
" Syntax: {{{
if s:configuration.enable_italic
  call s:HL('Type', s:palette.blue, s:palette.none, 'italic')
  call s:HL('Structure', s:palette.purple, s:palette.none, 'italic')
  call s:HL('StorageClass', s:palette.purple, s:palette.none, 'italic')
  call s:HL('Identifier', s:palette.purple, s:palette.none, 'italic')
  call s:HL('Constant', s:palette.purple, s:palette.none, 'italic')
else
  call s:HL('Type', s:palette.blue, s:palette.none)
  call s:HL('Structure', s:palette.purple, s:palette.none)
  call s:HL('StorageClass', s:palette.purple, s:palette.none)
  call s:HL('Identifier', s:palette.purple, s:palette.none)
  call s:HL('Constant', s:palette.purple, s:palette.none)
endif
call s:HL('PreProc', s:palette.white, s:palette.none)
call s:HL('PreCondit', s:palette.purple, s:palette.none)
call s:HL('Include', s:palette.purple, s:palette.none)
call s:HL('Keyword', s:palette.purple, s:palette.none)
call s:HL('Define', s:palette.purple, s:palette.none)
call s:HL('Typedef', s:palette.purple, s:palette.none)
call s:HL('Exception', s:palette.purple, s:palette.none)
call s:HL('Conditional', s:palette.purple, s:palette.none)
call s:HL('Repeat', s:palette.purple, s:palette.none)
call s:HL('Statement', s:palette.purple, s:palette.none)
call s:HL('Macro', s:palette.purple, s:palette.none)
call s:HL('Error', s:palette.red, s:palette.none, 'bold,underline')
call s:HL('Label', s:palette.purple, s:palette.none)
call s:HL('Special', s:palette.purple, s:palette.none)
call s:HL('SpecialChar', s:palette.purple, s:palette.none)
call s:HL('Boolean', s:palette.green, s:palette.none)
call s:HL('String', s:palette.green, s:palette.none)
call s:HL('Character', s:palette.green, s:palette.none, 'bold')
call s:HL('Number', s:palette.green, s:palette.none)
call s:HL('Float', s:palette.green, s:palette.none)
call s:HL('Function', s:palette.orange, s:palette.none)
call s:HL('Operator', s:palette.purple, s:palette.none)
call s:HL('Title', s:palette.green, s:palette.none, 'bold')
call s:HL('Tag', s:palette.white, s:palette.none)
call s:HL('Delimiter', s:palette.pink, s:palette.none, 'bold')
if s:configuration.disable_italic_comment
  call s:HL('Comment', s:palette.gray, s:palette.none)
  call s:HL('SpecialComment', s:palette.gray, s:palette.none)
  call s:HL('Todo', s:palette.green, s:palette.none, 'bold')
else
  call s:HL('Comment', s:palette.gray, s:palette.none, 'italic')
  call s:HL('SpecialComment', s:palette.gray, s:palette.none, 'italic')
  call s:HL('Todo', s:palette.green, s:palette.none, 'bold,italic')
endif
call s:HL('Ignore', s:palette.gray, s:palette.none)
call s:HL('Underlined', s:palette.none, s:palette.none, 'underline')
" }}}
" Predefined Highlight Groups: {{{
call s:HL('Fg', s:palette.white, s:palette.none)
call s:HL('Grey', s:palette.gray, s:palette.none)
call s:HL('Red', s:palette.red, s:palette.none)
call s:HL('Orange', s:palette.orange, s:palette.none)
call s:HL('Yellow', s:palette.yellow, s:palette.none)
call s:HL('Green', s:palette.green, s:palette.none)
call s:HL('Blue', s:palette.blue, s:palette.none)
call s:HL('Purple', s:palette.purple, s:palette.none)
if s:configuration.enable_italic
  call s:HL('RedItalic', s:palette.red, s:palette.none, 'italic')
  call s:HL('BlueItalic', s:palette.blue, s:palette.none, 'italic')
  call s:HL('OrangeItalic', s:palette.orange, s:palette.none, 'italic')
else
  call s:HL('RedItalic', s:palette.red, s:palette.none)
  call s:HL('BlueItalic', s:palette.blue, s:palette.none)
  call s:HL('OrangeItalic', s:palette.orange, s:palette.none)
endif
" }}}
" 
" }}}
" Extended File Types: {{{
" Markdown: {{{
" builtin: {{{
call s:HL('markdownH1', s:palette.orange, s:palette.none, 'bold')
call s:HL('markdownH2', s:palette.orange, s:palette.none, 'bold')
call s:HL('markdownH3', s:palette.orange, s:palette.none, 'bold')
call s:HL('markdownH4', s:palette.orange, s:palette.none, 'bold')
call s:HL('markdownH5', s:palette.orange, s:palette.none, 'bold')
call s:HL('markdownH6', s:palette.orange, s:palette.none, 'bold')
call s:HL('markdownUrl', s:palette.purple, s:palette.none, 'underline')
call s:HL('markdownItalic', s:palette.white, s:palette.none, 'italic')
call s:HL('markdownBold', s:palette.white, s:palette.none, 'bold')
call s:HL('markdownItalicDelimiter', s:palette.gray, s:palette.none, 'italic')
highlight! link markdownCode Green
highlight! link markdownCodeBlock Green
highlight! link markdownCodeDelimiter Green
highlight! link markdownBlockquote Grey
highlight! link markdownListMarker Purple
highlight! link markdownOrderedListMarker Purple
highlight! link markdownRule Grey
highlight! link markdownHeadingRule Grey
highlight! link markdownUrlDelimiter White
highlight! link markdownLinkDelimiter White
highlight! link markdownLinkTextDelimiter White
highlight! link markdownHeadingDelimiter Purple
highlight! link markdownLinkText Green
highlight! link markdownUrlTitleDelimiter White
highlight! link markdownIdDeclaration Green
highlight! link markdownBoldDelimiter Grey
highlight! link markdownId Yellow
" }}}
" vim-markdown: https://github.com/gabrielelana/vim-markdown{{{
call s:HL('mkdURL', s:palette.purple, s:palette.none, 'underline')
call s:HL('mkdInlineURL', s:palette.purple, s:palette.none, 'underline')
call s:HL('mkdItalic', s:palette.gray, s:palette.none, 'italic')
highlight! link mkdCodeDelimiter Green
highlight! link mkdBold Grey
highlight! link mkdLink Green
highlight! link mkdHeading Grey
highlight! link mkdListItem Purple
highlight! link mkdRule Grey
highlight! link mkdDelimiter Grey
highlight! link mkdId Yellow
" }}}
" }}}
" Html: {{{
" builtin: https://notabug.org/jorgesumle/vim-html-syntax{{{
call s:HL('htmlH1', s:palette.white, s:palette.none, 'bold')
call s:HL('htmlH2', s:palette.white, s:palette.none, 'bold')
call s:HL('htmlH3', s:palette.white, s:palette.none, 'bold')
call s:HL('htmlH4', s:palette.white, s:palette.none, 'bold')
call s:HL('htmlH5', s:palette.white, s:palette.none, 'bold')
call s:HL('htmlH6', s:palette.white, s:palette.none, 'bold')
call s:HL('htmlLink', s:palette.white, s:palette.none, 'underline')
call s:HL('htmlBold', s:palette.white, s:palette.none, 'bold')
call s:HL('htmlBoldUnderline', s:palette.white, s:palette.none, 'bold,underline')
call s:HL('htmlBoldItalic', s:palette.white, s:palette.none, 'bold,italic')
call s:HL('htmlBoldUnderlineItalic', s:palette.white, s:palette.none, 'bold,underline,italic')
call s:HL('htmlUnderline', s:palette.white, s:palette.none, 'underline')
call s:HL('htmlUnderlineItalic', s:palette.white, s:palette.none, 'underline,italic')
call s:HL('htmlItalic', s:palette.white, s:palette.none, 'italic')
highlight! link htmlTag White
highlight! link htmlEndTag White
highlight! link htmlTagN Purple
highlight! link htmlTagName Purple
highlight! link htmlArg Pink
highlight! link htmlScriptTag Purple
highlight! link htmlSpecialTagName Purple
highlight! link htmlString Green
" }}}
" }}}
" CSS: {{{
" builtin: https://github.com/JulesWang/css.vim{{{
highlight! link cssStringQ Green
highlight! link cssStringQQ Green
highlight! link cssAttrComma Grey
highlight! link cssBraces Grey
highlight! link cssTagName Purple
highlight! link cssClassNameDot Blue
highlight! link cssClassName Blue
highlight! link cssFunctionName Orange
highlight! link cssAttr White
highlight! link cssCommonAttr White
highlight! link cssProp Pink
highlight! link cssPseudoClassId Pink
highlight! link cssPseudoClassFn Orange
highlight! link cssPseudoClass Pink
highlight! link cssImportant Purple
highlight! link cssSelectorOp Purple
highlight! link cssSelectorOp2 Purple
highlight! link cssColor Purple
highlight! link cssUnitDecorators Purple
highlight! link cssValueLength Green
highlight! link cssValueInteger Green
highlight! link cssValueNumber Green
highlight! link cssValueAngle Green
highlight! link cssValueTime Green
highlight! link cssValueFrequency Green
highlight! link cssVendor Grey
highlight! link cssNoise Pink
" }}}
" }}}
" JavaScript: {{{
" builtin: http://www.fleiner.com/vim/syntax/javascript.vim{{{
highlight! link javaScriptNull Purple
highlight! link javaScriptIdentifier Purple
highlight! link javaScriptParens Orange
highlight! link javaScriptBraces Orange
highlight! link javaScriptNumber Green
highlight! link javaScriptLabel Purple
highlight! link javaScriptGlobal White
highlight! link javaScriptMessage White
" }}}
" }}}
" JavaScript React: {{{
" vim-jsx-pretty: https://github.com/maxmellon/vim-jsx-pretty{{{
highlight! link jsxTagName Purple
highlight! link jsxOpenPunct White
highlight! link jsxClosePunct White
highlight! link jsxEscapeJs Purple
highlight! link jsxAttrib Pink
" }}}
" }}}
" TypeScript: {{{
" yats: https:github.com/HerringtonDarkholme/yats.vim{{{
highlight! link typescriptVariable Purple
highlight! link typescriptTypeReference Blue
highlight! link typescriptBraces Orange
highlight! link typescriptEnum Blue
highlight! link typescriptIdentifierName White
highlight! link typescriptProp White
highlight! link typescriptCall White
highlight! link typescriptInterfaceName Blue
highlight! link typescriptEndColons White
highlight! link typescriptMember Pink
highlight! link typescriptObjectLabel White
highlight! link typescriptDefaultParam White
highlight! link typescriptArrowFunc Purple
" }}}
" }}}
" Json: {{{
highlight! link jsonKeyword Purple
highlight! link jsonString Green
highlight! link jsonBoolean Green
highlight! link jsonNoise Pink
highlight! link jsonQuote Green
highlight! link jsonBraces Pink
" }}}
" Yaml: {{{
highlight! link yamlBlockMappingKey Purple
highlight! link yamlConstant Pink
highlight! link yamlBlockCollectionItemStart White
highlight! link yamlFlowIndicator Orange
highlight! link yamlKeyValueDelimiter Pink
" }}}
" }}}
" Plugins: {{{
" junegunn/vim-plug{{{
call s:HL('plug1', s:palette.red, s:palette.none, 'bold')
call s:HL('plugNumber', s:palette.yellow, s:palette.none, 'bold')
highlight! link plug2 Blue
highlight! link plugBracket Blue
highlight! link plugName Green
highlight! link plugDash Red
highlight! link plugNotLoaded Grey
highlight! link plugH2 Purple
highlight! link plugMessage Purple
highlight! link plugError Red
highlight! link plugRelDate Grey
highlight! link plugStar Purple
highlight! link plugUpdate Blue
highlight! link plugDeleted Grey
highlight! link plugEdge Purple
" }}}
" dense-analysis/ale{{{
call s:HL('ALEError', s:palette.none, s:palette.none, 'undercurl', s:palette.red)
call s:HL('ALEWarning', s:palette.none, s:palette.none, 'undercurl', s:palette.orange)
call s:HL('ALEInfo', s:palette.none, s:palette.none, 'undercurl', s:palette.cyan)
if s:configuration.transparent_background
  call s:HL('ALEErrorSign', s:palette.red, s:palette.none)
  call s:HL('ALEWarningSign', s:palette.orange, s:palette.none)
  call s:HL('ALEInfoSign', s:palette.cyan, s:palette.none)
else
  call s:HL('ALEErrorSign', s:palette.red, s:palette.black)
  call s:HL('ALEWarningSign', s:palette.orange, s:palette.black)
  call s:HL('ALEInfoSign', s:palette.cyan, s:palette.black)
endif
highlight! link ALEVirtualTextError Grey
highlight! link ALEVirtualTextWarning Grey
highlight! link ALEVirtualTextInfo Grey
highlight! link ALEVirtualTextStyleError ALEVirtualTextError
highlight! link ALEVirtualTextStyleWarning ALEVirtualTextWarning
" }}}
" airblade/vim-gitgutter{{{
if s:configuration.transparent_background
  call s:HL('GitGutterAdd', s:palette.green, s:palette.none)
  call s:HL('GitGutterChange', s:palette.blue, s:palette.none)
  call s:HL('GitGutterDelete', s:palette.red, s:palette.none)
  call s:HL('GitGutterChangeDelete', s:palette.purple, s:palette.none)
else
  call s:HL('GitGutterAdd', s:palette.green, s:palette.black)
  call s:HL('GitGutterChange', s:palette.blue, s:palette.black)
  call s:HL('GitGutterDelete', s:palette.red, s:palette.black)
  call s:HL('GitGutterChangeDelete', s:palette.purple, s:palette.black)
endif
" }}}
" scrooloose/nerdtree{{{
highlight! link NERDTreeDir Yellow
highlight! link NERDTreeDirSlash Yellow
highlight! link NERDTreeOpenable Blue
highlight! link NERDTreeClosable Blue
highlight! link NERDTreeFile Magenta
highlight! link NERDTreeExecFile Red
highlight! link NERDTreeUp Grey
highlight! link NERDTreeCWD Purple
highlight! link NERDTreeHelp Grey
highlight! link NERDTreeToggleOn Green
highlight! link NERDTreeToggleOff Red
highlight! link NERDTreeFlags Blue
highlight! link NERDTreeLinkFile Grey
highlight! link NERDTreeLinkTarget Green
" }}}
" }}}
" Terminal: {{{
if (has('termguicolors') && &termguicolors) || has('gui_running')
  " Definition
  let s:terminal = {
        \ 'black':    s:palette.black,
        \ 'red':      s:palette.red,
        \ 'yellow':   s:palette.yellow,
        \ 'green':    s:palette.green,
        \ 'cyan':     s:palette.cyan,
        \ 'blue':     s:palette.blue,
        \ 'purple':   s:palette.purple,
        \ 'white':    s:palette.white
        \ }
  " Implementation: {{{
  if !has('nvim')
    let g:terminal_ansi_colors = [s:terminal.black[0], s:terminal.red[0], s:terminal.green[0], s:terminal.yellow[0],
          \ s:terminal.blue[0], s:terminal.purple[0], s:terminal.cyan[0], s:terminal.white[0], s:terminal.black[0], s:terminal.red[0],
          \ s:terminal.green[0], s:terminal.yellow[0], s:terminal.blue[0], s:terminal.purple[0], s:terminal.cyan[0], s:terminal.white[0]]
  else
    let g:terminal_color_0 = s:terminal.black[0]
    let g:terminal_color_1 = s:terminal.red[0]
    let g:terminal_color_2 = s:terminal.green[0]
    let g:terminal_color_3 = s:terminal.yellow[0]
    let g:terminal_color_4 = s:terminal.blue[0]
    let g:terminal_color_5 = s:terminal.purple[0]
    let g:terminal_color_6 = s:terminal.cyan[0]
    let g:terminal_color_7 = s:terminal.white[0]
    let g:terminal_color_8 = s:terminal.black[0]
    let g:terminal_color_9 = s:terminal.red[0]
    let g:terminal_color_10 = s:terminal.green[0]
    let g:terminal_color_11 = s:terminal.yellow[0]
    let g:terminal_color_12 = s:terminal.blue[0]
    let g:terminal_color_13 = s:terminal.purple[0]
    let g:terminal_color_14 = s:terminal.cyan[0]
    let g:terminal_color_15 = s:terminal.white[0]
  endif
  " }}}
endif
" }}}

" vim: set sw=2 ts=2 sts=2 et tw=80 ft=vim fdm=marker fmr={{{,}}}:
