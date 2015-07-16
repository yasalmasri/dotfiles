""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 1. Vbundle
"
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set nocompatible              " be iMproved, required
filetype off                  " required
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 2. Plugin list
"
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

Plugin 'git://github.com/kien/ctrlp.vim.git'
Plugin 'airblade/vim-gitgutter'
Plugin 'git://github.com/sickill/vim-monokai'
Plugin 'sjl/gundo.vim'
Plugin 'tComment'
Plugin 'chreekat/vim-paren-crosshairs'
Plugin 'scrooloose/nerdtree'
Plugin 'git://github.com/ngmy/vim-rubocop.git'
Plugin 'jelera/vim-javascript-syntax'

" Plugin 'tpope/vim-surround'
" Plugin 'git://github.com/ngmy/vim-rubocop.git'
" Plugin 'git://github.com/scrooloose/syntastic.git'
" Plugin 'git://github.com/terryma/vim-multiple-cursors.git'
"
" Plugin 'scrooloose/nerdtree'

" Plugin 'Lokaltog/vim-easymotion'
" Plugin 'godlygeek/tabular'
" Plugin 'kchmck/vim-coffee-script'
" " Bundle 'rgp/PHP-Indenting-for-VIm'
" Plugin 'terryma/vim-expand-region'
" Plugin 'MarcWeber/vim-addon-mw-utils'
" Plugin 'tomtom/tlib_vim'
" Plugin 'rgp/snipmate-snippets'
" Plugin 'garbas/vim-snipmate'

" " My Bundles here:
"Bundle 'scrooloose/nerdtree'
"Bundle 'MarcWeber/vim-addon-mw-utils'
"Bundle 'tomtom/tlib_vim'
"Bundle 'rgp/snipmate-snippets'
"Bundle 'garbas/vim-snipmate'
"Bundle 'Lokaltog/vim-easymotion'
"Bundle 'godlygeek/tabular'
"Bundle 'tpope/vim-surround'
"Bundle 'chreekat/vim-paren-crosshairs'
"Bundle 'altercation/vim-colors-solarized'
"Bundle 'kchmck/vim-coffee-script'
"" Bundle 'rgp/PHP-Indenting-for-VIm'
"Bundle 'terryma/vim-expand-region'

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Vbundle trailer
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 3. Color scheme
"
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
syntax enable
colorscheme monokai

" Prettify JSON files
autocmd BufRead,BufNewFile *.json set filetype=json
autocmd Syntax json sou ~/.vim/syntax/json.vim

 " Prettify Vagrantfile
autocmd BufRead,BufNewFile Vagrantfile set filetype=ruby

" Prettify Markdown files
augroup markdown
  au!
  au BufNewFile,BufRead *.md,*.markdown setlocal filetype=ghmarkdown
augroup END

" Highlight characters that go over 80 columns (by drawing a border on the 81st)
if exists('+colorcolumn')
  set colorcolumn=81
  highlight ColorColumn ctermbg=red
else
  highlight OverLength ctermbg=red ctermfg=white guibg=#592929
  match OverLength /\%81v.\+/
endif

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 4. Configuration
"
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Backup files (.swo .swp)
set nobackup
set noswapfile
set nowrap

" Format config
set expandtab
set tabstop=2
set shiftwidth=2
set softtabstop=2
set autoindent            " auto-indent
set shiftround            " always indent/outdent to the nearest tabstop

" Search config
set nohlsearch            " Don't continue to highlight searched phrases.
set incsearch             " But do highlight as you type your search.
set ignorecase            " Make searches case-insensitive.

set laststatus=2          " last window always has a statusline
set number                " show line numbers
set ruler                 " Always show info along bottom.
set t_Co=256              " enable 256-color mode.

" set showmatch
set statusline=%<%f\%h%m%r%=%-20.(line=%l\ \ col=%c%V\ \ totlin=%L%)\ \ \%h%m%r%=%-40(bytval=0x%B,%n%Y%)\%P
" set visualbell


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" TRASHCAN
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" " GVIM options
" set guioptions-=T
"
let mapleader = ","
"
nnoremap <leader>d :NERDTreeToggle<cr>
" nnoremap <leader>g :GundoToggle<cr>
"
" " Configuracion personal
" " colorscheme desert
" vmap ,x :!tidy -q -i --show-errors 0<CR>
" nnoremap <leader>c :nohlsearch<cr>
"
"
" "PHP INDENT
" nnoremap <leader>h :%!xxd<cr>
" nnoremap <leader>r :%!xxd -r<cr>
"
" map <leader>aa :set tabstop=2  shiftwidth=2 <cr>
" map <leader>aaaa :set tabstop=4  shiftwidth=4 <cr>
" map <leader>rn :set relativenumber <cr>
" map <leader>nrn :set number <cr>
"
" au BufRead,BufNewFile *.phtml set filetype=html
" au BufReadPost *.phtml set syntax=php
"
" set runtimepath^=~/.vim/bundle/ctrlp.vim
" nnoremap <leader>p :CtrlP<cr>
" let g:vimrubocop_keymap = 0
nnoremap <leader>r :RuboCop<cr>
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
vnoremap p "0p
