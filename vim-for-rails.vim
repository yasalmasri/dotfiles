""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 1. Vbundle
" """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
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
Plugin 'slim-template/vim-slim.git'
Plugin 'thoughtbot/vim-rspec'
Plugin 'kchmck/vim-coffee-script'
Plugin 'bronson/vim-trailing-whitespace'
Plugin 'honza/vim-snippets'
Plugin 'vim-ruby/vim-ruby'
Plugin 'henrik/vim-ruby-runner'
Plugin 'SirVer/ultisnips'
Plugin 'nono/vim-handlebars'
Plugin 'gaogao1030/vim-slimbars'
Plugin 'mattn/emmet-vim'
Plugin 'easymotion/vim-easymotion'
Plugin 'leafgarland/typescript-vim'
Plugin 'posva/vim-vue'
Plugin 'editorconfig/editorconfig-vim'
Plugin 'briancollins/vim-jst'
Plugin 'tpope/vim-surround'

" Plugin 'gko/vim-coloresque'
" Plugin 'captbaritone/better-indent-support-for-php-with-html'
" Plugin 'vim-scripts/jade.vim'
" Plugin 'fatih/vim-go'
" Plugin 'othree/html5.vim'
" Plugin 'elixir-lang/vim-elixir'
" Plugin 'git://github.com/scrooloose/syntastic.git'
" Plugin 'git://github.com/terryma/vim-multiple-cursors.git'

" Plugin 'godlygeek/tabular'
" Plugin 'kchmck/vim-coffee-script'
" Bundle 'rgp/PHP-Indenting-for-VIm'
" Plugin 'terryma/vim-expand-region'
" Plugin 'MarcWeber/vim-addon-mw-utils'
" Plugin 'tomtom/tlib_vim'
" Plugin 'rgp/snipmate-snippets'
" Plugin 'garbas/vim-snipmate'

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
" autocmd BufRead,BufNewFile *.json set filetype=json
" autocmd Syntax json sou ~/.vim/syntax/json.vim

" Automatically removing all trailing whitespace at the end of line.
" autocmd BufWritePre * :%s/\s\+$//

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
set cursorline
set cursorline cursorcolumn " show cursor vertical highlight

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
set relativenumber        " show line numbers
set ruler                 " Always show info along bottom.
set t_Co=256              " enable 256-color mode.

" set showmatch
set statusline=%<%f\%h%m%r%=%-20.(line=%l\ \ col=%c%V\ \ totlin=%L%)\ \ \%h%m%r%=%-40(bytval=0x%B,%n%Y%)\%P
" set visualbell

autocmd Filetype javascript setlocal ts=2 sw=2 sts=0 expandtab
autocmd Filetype coffeescript setlocal ts=4 sw=4 sts=0 expandtab
autocmd Filetype jade setlocal ts=4 sw=4 sts=0 expandtab
autocmd Filetype php setlocal ts=4 sw=4 sts=0 expandtab
autocmd Filetype json setlocal ts=4 sw=4 sts=0 expandtab
autocmd Filetype ruby setlocal ts=2 sw=2 sts=0 expandtab
autocmd Filetype html setlocal ts=2 sw=2 sts=0 expandtab

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" TRASHCAN
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" " GVIM options
" set guioptions-=T
"
let mapleader = " "
"
nnoremap <leader>d :NERDTreeToggle<cr>
nnoremap <leader>g :GundoToggle<cr>

" remove trailing whitespace
map <Leader>c :%s/\s\+$//<CR>
" map <Leader>c :FixWhitespace<CR>

" " Configuracion personal
" " colorscheme desert
" vmap ,x :!tidy -q -i --show-errors 0<CR>
" nnoremap <leader>c :nohlsearch<cr>
" Press F4 to toggle highlighting on/off, and show current value.
" :noremap <leader>h :set hlsearch! hlsearch?<CR>
" :nnoremap <CR> :nohlsearch<CR><CR>



" map <leader>aa :set tabstop=2  shiftwidth=2 <cr>
" map <leader>aaaa :set tabstop=4  shiftwidth=4 <cr>
map <leader>rn :set relativenumber <cr>
map <leader>nu :set norelativenumber <cr>

nnoremap <leader>r :RuboCop<cr>
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
nnoremap <C-T> <C-W><C-T>
vnoremap <leader>p "0p
nmap K k

" Ctrl + P
map <Leader>b :CtrlPBuffer<CR>
let g:ctrlp_show_hidden = 1

" format JSON
map <Leader>j :%!python3 -m json.tool<CR>
" indent all lines
map <Leader>= mzgg=GG`zzz
" select line
map <Leader>vw ^v$h
" select tag
map <Leader>vt vatV
" map <F6> v%Vy

:command! W :w
:command! Wq :wq
:command! Q :q

" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"

" Emmet leader
" let g:user_emmet_leader_key='<C-M>'

autocmd BufRead,BufNewFile *.axlsx set filetype=ruby
autocmd BufRead,BufNewFile *.vue set filetype=html
