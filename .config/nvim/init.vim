set nocompatible              " be iMproved, required
filetype off                  " required
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'ryanoasis/vim-devicons'
Plugin 'tpope/vim-surround'
Plugin 'tomtom/tcomment_vim'
Plugin 'tmhedberg/matchit'
Plugin 'Raimondi/delimitMate'
Plugin 'itchyny/lightline.vim'
Plugin 'chrisbra/unicode.vim'
Plugin 'sheerun/vim-polyglot'
Plugin 'Yggdroot/indentLine'
Plugin 'ervandew/supertab'
Plugin 'JulesWang/css.vim'
Plugin 'chr4/nginx.vim'
Plugin 'chr4/sslsecure.vim'
Plugin 'vim-utils/vim-husk'
Plugin 'chrisbra/Colorizer'
Plugin 'airblade/vim-gitgutter'
Plugin 'lifepillar/vim-colortemplate'
Plugin 'tiagofumo/vim-nerdtree-syntax-highlight'
Plugin 'KeitaNakamura/neodark.vim'
Plugin 'godlygeek/tabular'
Plugin 'tommcdo/vim-exchange'
Plugin 'easymotion/vim-easymotion'
Plugin 'trevordmiller/nova-vim'
Plugin 'vimwiki/vimwiki'
Plugin 'Shougo/denite.nvim'
Plugin 'neoclide/coc.nvim'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

map <C-n> :NERDTreeToggle<CR>

if (has("termguicolors"))
  set termguicolors
endif
set encoding=UTF-8
set fileencoding=utf-8
syntax on

set tabstop=2 softtabstop=2 expandtab shiftwidth=2 smarttab

set relativenumber
set number                            " show line numbers in gutter

set autoindent                  "keep indent on new lines
set backspace=indent,start,eol  "allow unrestricted backspace in insert mode

if has('linebreak')
  let &showbreak='↪'                 " ARROW POINTING DOWNWARDS THEN CURVING RIGHTWARDS (U+2937, UTF-8: E2 A4 B7)
  set breakindent                     " indent wrapped lines to match start
  if exists('&breakindentopt')
    set breakindentopt=shift:2        " emphasize broken lines by indenting them
  endif
endif

if exists('+colorcolumn')
  " Highlight up to 255 columns (this is the current Vim max) beyond 'textwidth'
  let &l:colorcolumn='+' . join(range(0, 254), ',+')
endif

set cursorline                        " highlight current line

if has('folding')
  if has('windows')
    set fillchars=vert:┃              " BOX DRAWINGS HEAVY VERTICAL (U+2503, UTF-8: E2 94 83)
  endif
  set foldlevelstart=99               " start unfolded
endif

set list                              " show whitespace
set listchars=nbsp:⦸                  " CIRCLED REVERSE SOLIDUS (U+29B8, UTF-8: E2 A6 B8)
set listchars+=tab:▷┅                 " WHITE RIGHT-POINTING TRIANGLE (U+25B7, UTF-8: E2 96 B7)
                                      " + BOX DRAWINGS HEAVY TRIPLE DASH HORIZONTAL (U+2505, UTF-8: E2 94 85)
set listchars+=extends:»              " RIGHT-POINTING DOUBLE ANGLE QUOTATION MARK (U+00BB, UTF-8: C2 BB)
set listchars+=precedes:«             " LEFT-POINTING DOUBLE ANGLE QUOTATION MARK (U+00AB, UTF-8: C2 AB)
set listchars+=trail:•                " BULLET (U+2022, UTF-8: E2 80 A2)
set nojoinspaces                      " don't autoinsert two spaces after '.', '?', '!' for join command
set noshowmatch                       " don't jump between matching brackets

if has('windows')
  set splitbelow                      " open horizontal splits below current window
endif
if has('vertsplit')
  set splitright                      " open vertical splits to the right of the current window
endif

set wildmenu

set belloff=all

" IndentLines
let g:indentLine_fileTypeExclude=['help']
let g:indentLine_bufNameExclude=['NERD_tree.*']
"let g:indentLine_char = '│'

"Ctrl+H-J-K-L to move between splits
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

"Better focus in active split - taken from Greg Hurrel https://github.com/wincent
if exists('+colorcolumn')
  autocmd BufEnter,FocusGained,VimEnter,WinEnter * if Should_colorcolumn() | let &l:colorcolumn='+' . join(range(0, 254), ',+') | endif
  autocmd FocusLost,WinLeave * if Should_colorcolumn() | let &l:colorcolumn=join(range(1, 255), ',') | endif
endif
autocmd InsertLeave,VimEnter,WinEnter * if Should_cursorline() | setlocal cursorline | endif
autocmd InsertEnter,WinLeave * if Should_cursorline() | setlocal nocursorline | endif
let g:WincentColorColumnBlacklist = ['diff', 'undotree', 'nerdtree', 'qf']
let g:WincentCursorlineBlacklist = ['command-t']
let g:WincentMkviewFiletypeBlacklist = ['diff', 'hgcommit', 'gitcommit']
function! Should_colorcolumn() abort
  return index(g:WincentColorColumnBlacklist, &filetype) == -1
endfunction
function! Should_cursorline() abort
  return index(g:WincentCursorlineBlacklist, &filetype) == -1
endfunction

"Interpret Drupal .theme file as php
augroup filetypedetect
  au BufRead,BufNewFile *.theme set filetype=php
augroup END

let g:neodark#background = '#202020'
colorscheme neodark

highlight Comment cterm=italic gui=italic
hi htmlArg gui=italic cterm=italic
hi Type    gui=italic cterm=italic

let g:vimwiki_ext2syntax = {'.md': 'markdown', '.markdown': 'markdown', '.mdown': 'markdown'}
let g:vimwiki_list = [{'path': '~/Data/Wiki/',
                      \ 'syntax': 'markdown', 'ext': '.md'}]

" === Denite shorcuts === "
"   ;         - Browser currently open buffers
"   <leader>t - Browse list of files in current directory
"   <leader>g - Search current directory for occurences of given term and
"   close window if no results
"   <leader>j - Search current directory for occurences of word under cursor
nmap ; :Denite buffer -split=floating -winrow=1<CR>
nmap <leader>t :Denite file/rec -split=floating -winrow=1<CR>
nnoremap <leader>g :<C-u>Denite grep:. -no-empty -mode=normal<CR>
nnoremap <leader>j :<C-u>DeniteCursorWord grep:. -mode=normal<CR>
" Custom options for Denite
"   auto_resize             - Auto resize the Denite window height automatically.
"   prompt                  - Customize denite prompt
"   direction               - Specify Denite window direction as directly below current pane
"   winminheight            - Specify min height for Denite window
"   highlight_mode_insert   - Specify h1-CursorLine in insert mode
"   prompt_highlight        - Specify color of prompt
"   highlight_matched_char  - Matched characters highlight
"   highlight_matched_range - matched range highlight
let s:denite_options = {'default' : {
\ 'auto_resize': 1,
\ 'prompt': 'λ:',
\ 'direction': 'rightbelow',
\ 'winminheight': '10',
\ 'highlight_mode_insert': 'Visual',
\ 'highlight_mode_normal': 'Visual',
\ 'prompt_highlight': 'Function',
\ 'highlight_matched_char': 'Function',
\ 'highlight_matched_range': 'Normal'
\ }}
