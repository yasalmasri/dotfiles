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
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
Plugin 'sickill/vim-monokai'
Plugin 'scrooloose/nerdtree'
Plugin 'kien/ctrlp.vim'
Plugin 'airblade/vim-gitgutter'
Plugin 'tComment'
Plugin 'chreekat/vim-paren-crosshairs'
Plugin 'ngmy/vim-rubocop'
Plugin 'honza/vim-snippets'
Plugin 'MarcWeber/vim-addon-mw-utils'
Plugin 'tomtom/tlib_vim'
Plugin 'garbas/vim-snipmate'
Plugin 'mattn/emmet-vim'
Plugin 'easymotion/vim-easymotion'
Plugin 'editorconfig/editorconfig-vim'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-fugitive'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'vim-syntastic/syntastic'
Plugin 'farfanoide/inflector.vim'
" Plugin 'chrisbra/NrrwRgn'
" Plugin 'w0rp/ale'

Plugin 'vim-ruby/vim-ruby'
" Plugin 'jelera/vim-javascript-syntax'
Plugin 'pangloss/vim-javascript'
" Plugin 'isRuslan/vim-es6'
Plugin 'kchmck/vim-coffee-script'
Plugin 'slim-template/vim-slim'
Plugin 'wavded/vim-stylus'
Plugin 'Quramy/tsuquyomi'
Plugin 'Quramy/vim-js-pretty-template'
Plugin 'posva/vim-vue'
Plugin 'keith/swift.vim'
Plugin 'thoughtbot/vim-rspec'
Plugin 'itmammoth/run-rspec.vim'

set tags=tags,./.git/tags

"" Folding configuration
set foldcolumn=1
set foldmethod=syntax

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on

let mapleader = " "
let g:NERDTreeNodeDelimiter = "\u00a0"
nnoremap <leader>d :NERDTreeToggle<cr>

" Plugin 'kien/ctrlp.vim' Config:
map <Leader>b :CtrlPBuffer<CR>
let g:ctrlp_show_hidden = 1
let g:ctrlp_custom_ignore = '\v[\/](node_modules|target|dist)|(\.(swp|ico|git|svn))$'
let g:ctrlp_match_window = 'bottom,order:btt,min:1,max:10,results:30'

" Plugin 'garbas/vim-snipmate' Config:
let g:snipMate = get(g:, 'snipMate', {}) " Allow for vimrc re-sourcing
let g:snipMate.scope_aliases = {}
let g:snipMate.scope_aliases['ruby'] = 'ruby,rails'
set runtimepath+=/Users/yaser/.dotfiles/vim-snippets/

" :help html-indenting
" let g:javascript_plugin_ngdoc = 1
" let g:html_indent_script1 = 'auto'
let g:html_indent_script1 = 'zero'
" let g:html_indent_style1 = 'auto'

syntax enable
colorscheme monokai

" Prettify Vagrantfile
autocmd BufRead,BufNewFile Vagrantfile set filetype=ruby

" Prettify Markdown files
augroup markdown
  au!
  au BufNewFile,BufRead *.md,*.markdown setlocal filetype=ghmarkdown
augroup END

" Highlight characters that go over 100 columns (by drawing a border on the 101st)
if exists('+colorcolumn')
  set colorcolumn=101
  highlight ColorColumn ctermbg=red
else
  highlight OverLength ctermbg=red ctermfg=white guibg=#592929
  match OverLength /\%101v.\+/
endif

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
" Toggle Highlight Search
noremap <F4> :set hlsearch! hlsearch?<CR>

set laststatus=2          " last window always has a statusline
set number                " show line numbers
set relativenumber        " show line numbers
set ruler                 " Always show info along bottom.
set t_Co=256              " enable 256-color mode.
set showcmd               " show selected lines count

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

" autocmd BufRead,BufNewFile *.axlsx set filetype=ruby
" autocmd BufRead,BufNewFile *.vue set filetype=html

highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+\%#\@<!$/
" remove trailing whitespace
map <Leader>c :%s/\s\+$//<CR>

nnoremap <leader>r :RuboCop<cr>
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
nnoremap <C-T> <C-W><C-T>
vnoremap <leader>p "0p
nmap K k

" format JSON
map <Leader>j :%!python3 -m json.tool<CR>
" indent all lines
map <Leader>= mzgg=GG`zzz
" select line
map <Leader>V ^v$h
" select tag
map <Leader>vt vatV
" map <F6> v%Vy
" fold
map <Leader>f V$%zf
" zf{ fold function
map <Leader>zf{ V$%zf
" replace " with '
map <Leader>" :s/"/'/g<CR>
" replace ' with "
map <Leader>' :s/'/"/g<CR>
" set visualedit=all
map <Leader>vea :set ve=all<CR>
" set visualedit=block
map <Leader>veb :set ve=block<CR>

:command! W :w
:command! Wq :wq
:command! Q :q

if has("gui_macvim")
  " Press Ctrl-Tab to switch between open tabs (like browser tabs) to
  " the right side. Ctrl-Shift-Tab goes the other way.
  noremap <C-Tab> :tabnext<CR>
  noremap <C-S-Tab> :tabprev<CR>

  " Switch to specific tab numbers with Command-number
  noremap <D-1> :tabn 1<CR>
  noremap <D-2> :tabn 2<CR>
  noremap <D-3> :tabn 3<CR>
  noremap <D-4> :tabn 4<CR>
  noremap <D-5> :tabn 5<CR>
  noremap <D-6> :tabn 6<CR>
  noremap <D-7> :tabn 7<CR>
  noremap <D-8> :tabn 8<CR>
  noremap <D-9> :tabn 9<CR>
  " Command-0 goes to the last tab
  noremap <D-0> :tablast<CR>
endif

" Save folds
" augroup AutoSaveFolds
"   autocmd!
"   autocmd BufWinLeave *.* mkview
"   autocmd BufWinEnter *.* silent loadview
" augroup END

" vim-syntastic/syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 0
let g:syntastic_auto_loc_list = 0
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 0
let g:syntastic_javascript_checkers = ['standard']
let g:syntastic_enable_highlighting = 1
nnoremap <leader>e :SyntasticCheck<cr>

" Syntax coloring lines that are too long just slows down the world
" set synmaxcol=128
" set ttyfast " u got a fast terminal
" set ttyscroll=3
" set lazyredraw " to avoid scrolling problems
" set nocursorline

" Plugin 'farfanoide/inflector.vim'
let g:inflector_mapping = 'gI'

" Ruby Hash
" nnoremap <leader>rh :%s/:\([^=,'"]*\) =>/\1:/g<CR>
nnoremap <leader>rh :%s/[":]\([a-z0-9_]\+\)\("\)\?\( \)\?=>\( \)\?/\1: /g<CR>

" arkwright/vim-whiplash
let g:WhiplashProjectsDir = "~/dev/"
let g:WhiplashCommandName = "SW"
let g:WhiplashConfigDir = "~/dev/whiplash-config/"

function! DoPrettyXML()
  " save the filetype so we can restore it later
  let l:origft = &ft
  set ft=
  " delete the xml header if it exists. This will
  " permit us to surround the document with fake tags
  " without creating invalid xml.
  1s/<?xml .*?>//e
  " insert fake tags around the entire document.
  " This will permit us to pretty-format excerpts of
  " XML that may contain multiple top-level elements.
  0put ='<PrettyXML>'
  $put ='</PrettyXML>'
  silent %!xmllint --format -
  " xmllint will insert an <?xml?> header. it's easy enough to delete
  " if you don't want it.
  " delete the fake tags
  2d
  $d
  " restore the 'normal' indentation, which is one extra level
  " too deep due to the extra tags we wrapped around the document.
  silent %<
  " back to home
  1
  " restore the filetype
  exe "set ft=" . l:origft
endfunction
command! PrettyXML call DoPrettyXML()
nnoremap <leader>xml :PrettyXML<CR>

function! ParseJSON()
  :%s/\\n/\r/g
  :%s/\\"/"/g
endfunction
command! ParseJSON call ParseJSON()

" RSpec.vim mappings
map <Leader>t :call RunCurrentSpecFile()<CR>
map <Leader>s :call RunNearestSpec()<CR>
map <Leader>l :call RunLastSpec()<CR>
map <Leader>a :call RunAllSpecs()<CR>
let g:rspec_command = "bundle exec rspec {spec}"
let g:rspec_runner = "os_x_iterm2"

" itmammoth/run-rspec.vim
" nnoremap <leader>sp :RunSpec<CR>
" nnoremap <leader>sl :RunSpecLine<CR>
" nnoremap <leader>se :RunSpecLastRun<CR>
" nnoremap <leader>csp :RunSpecCloseResult<CR>
