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
"Plugin 'itchyny/lightline.vim'
Plugin 'chriskempson/base16-vim'
Plugin 'chrisbra/unicode.vim'
Plugin 'pangloss/vim-javascript'
Plugin 'elzr/vim-json'
Plugin 'StanAngeloff/php.vim'
Plugin 'Shougo/deoplete.nvim'
Plugin 'wincent/command-t'
Plugin 'Yggdroot/indentLine'
Plugin 'PotatoesMaster/i3-vim-syntax'
Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'
Plugin 'lumiliet/vim-twig'
Plugin 'ervandew/supertab'
Plugin 'JulesWang/css.vim'
Plugin 'othree/html5.vim'
Plugin 'cakebaker/scss-syntax.vim'
Plugin 'lifepillar/vim-solarized8'
Plugin 'chr4/nginx.vim'
Plugin 'chr4/sslsecure.vim'


" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

map <C-n> :NERDTreeToggle<CR>

" If you have vim >=8.0 or Neovim >= 0.1.5
if (has("termguicolors"))
  set termguicolors
endif
set encoding=UTF-8
set fileencoding=utf-8
syntax on
set background=light
colorscheme solarized8

"highlight Normal ctermbg=NONE guibg=NONE

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

" if filereadable(expand("~/.vimrc_background"))
"   let base16colorspace=256
"   source ~/.vimrc_background
" endif
"let &t_ZH="\e[3m"
"let &t_ZR="\e[23m"
highlight Comment cterm=italic

" Use deoplete.
let g:deoplete#enable_at_startup = 1

" pangloss/vim-javascript
let g:javascript_conceal_function             = "ƒ"
let g:javascript_conceal_null                 = "ø"
let g:javascript_conceal_this                 = "@"
let g:javascript_conceal_return               = "⇚"
let g:javascript_conceal_undefined            = "¿"
let g:javascript_conceal_NaN                  = "ℕ"
let g:javascript_conceal_prototype            = "¶"
let g:javascript_conceal_static               = "•"
let g:javascript_conceal_super                = "Ω"
let g:javascript_conceal_arrow_function       = "⇒"
let g:javascript_conceal_noarg_arrow_function = "🞅"
let g:javascript_conceal_underscore_arrow_function = "🞅"
set conceallevel=1

" IndentLines
let g:indentLine_fileTypeExclude=['help']
let g:indentLine_bufNameExclude=['NERD_tree.*']
let g:indentLine_char = '┊'

"Ruby
let g:ruby_host_prog = '/home/fzic/.gem/ruby/2.5.0/bin/neovim-ruby-host'

"UltiSnips
let g:UltiSnipsExpandTrigger="<Tab>"
let g:UltiSnipsJumpForwardTrigger="<Tab>"
let g:UltiSnipsJumpBackwardTrigger="<S-Tab>"

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
