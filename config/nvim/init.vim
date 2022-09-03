"" Plugins with vim-plug
"" https://github.com/junegunn/vim-plug
call plug#begin()

Plug 'preservim/nerdtree'
Plug 'Mofiqul/dracula.nvim'
Plug 'dense-analysis/ale'
Plug 'tomtom/tcomment_vim'

Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-surround'
Plug 'majutsushi/tagbar'
Plug 'kien/ctrlp.vim'
Plug 'mattn/emmet-vim'
Plug 'honza/vim-snippets'
Plug 'easymotion/vim-easymotion'
Plug 'terryma/vim-multiple-cursors'
Plug 'garbas/vim-snipmate'
Plug 'editorconfig/editorconfig-vim'
Plug 'farfanoide/inflector.vim'
Plug 'andymass/vim-matchup'
Plug 'yggdroot/indentline'
Plug 'MarcWeber/vim-addon-mw-utils'

Plug 'vim-ruby/vim-ruby'
Plug 'tpope/vim-rails'
Plug 'ngmy/vim-rubocop'
Plug 'thoughtbot/vim-rspec'
Plug 'itmammoth/run-rspec.vim'

call plug#end()

"" Folding configuration
set foldcolumn=1
set foldmethod=syntax
filetype plugin indent on    " required
let mapleader = " "

" dracula/vim, should be set before loading the colorscheme
let g:dracula_italic = 0
" let g:dracula_colorterm = 0

syntax enable
" colorscheme monokai
colorscheme dracula

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
" set relativenumber        " show line numbers
set ruler                 " Always show info along bottom.
set t_Co=256              " enable 256-color mode.
set showcmd               " show selected lines count

" set showmatch
set statusline=%<%f\%h%m%r%=%-20.(line=%l\ \ col=%c%V\ \ totlin=%L%)\ \ \%h%m%r%=%-40(bytval=0x%B,%n%Y%)\%P
" set visualbell

autocmd Filetype javascript setlocal ts=2 sw=2 sts=0 expandtab
" autocmd Filetype coffeescript setlocal ts=4 sw=4 sts=0 expandtab
" autocmd Filetype jade setlocal ts=4 sw=4 sts=0 expandtab
" autocmd Filetype php setlocal ts=4 sw=4 sts=0 expandtab
autocmd Filetype json setlocal ts=4 sw=4 sts=0 expandtab
autocmd Filetype ruby setlocal ts=2 sw=2 sts=0 expandtab
autocmd Filetype html setlocal ts=2 sw=2 sts=0 expandtab

" autocmd BufRead,BufNewFile *.axlsx set filetype=ruby
" autocmd BufRead,BufNewFile *.vue set filetype=html

highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+\%#\@<!$/
" remove trailing whitespace
map <Leader>c :%s/\s\+$//<CR>

nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
" nnoremap <C-T> <C-W><C-T>
vnoremap <leader>p "0p
nmap K k

" Buffers - explore/next/previous: Alt--, Alt-=
nnoremap – :bp<CR>
nnoremap ≠ :bn<CR>

" ctags
nnoremap <f5> :!ctags -R --languages=ruby<CR>

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
" Copy selected text
map <Leader>ct "*y<CR>

:command! W :w
:command! Wq :wq
:command! Q :q

" Tabs config
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

" Syntax coloring lines that are too long just slows down the world
" set synmaxcol=128
" set ttyfast " u got a fast terminal
" set ttyscroll=3
" set lazyredraw " to avoid scrolling problems
" set nocursorline

" Ruby Hash
" nnoremap <leader>rh :%s/:\([^=,'"]*\) =>/\1:/g<CR>
nnoremap <leader>rh :%s/[":]\([a-z0-9_]\+\)\("\)\?\( \)\?=>\( \)\?/\1: /g<CR>

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

" Plugins Configs

" Plugin 'scrooloose/nerdtree' Config:
let g:NERDTreeNodeDelimiter = "\u00a0"
nnoremap <leader>d :NERDTreeToggle<cr>

" Plugin dense-analysis/ale
let g:ale_fixers = {
\   '*': ['remove_trailing_lines', 'trim_whitespace'],
\   'ruby': ['rubocop'],
\}

" Plugin 'kien/ctrlp.vim' Config:
map <Leader>b :CtrlPBuffer<CR>
let g:ctrlp_show_hidden = 1
let g:ctrlp_custom_ignore = '\v[\/](node_modules|target|dist)|(\.(swp|ico|git|svn))$'
let g:ctrlp_match_window = 'bottom,order:btt,min:1,max:10,results:30'

" Plugin 'garbas/vim-snipmate' Config:
let g:snipMate = get(g:, 'snipMate', {}) " Allow for vimrc re-sourcing
let g:snipMate.snippet_version = 1
let g:snipMate.scope_aliases = {}
let g:snipMate.scope_aliases['ruby'] = 'ruby,rails'
set runtimepath+=~/.dotfiles/vim-snippets/

" Plugin 'farfanoide/inflector.vim'
let g:inflector_mapping = 'gI'

" RSpec.vim mappings
map <Leader>t :call RunCurrentSpecFile()<CR>
map <Leader>s :call RunNearestSpec()<CR>
map <Leader>l :call RunLastSpec()<CR>
map <Leader>a :call RunAllSpecs()<CR>
let g:rspec_command = "bundle exec rspec {spec}"
let g:rspec_runner = "os_x_iterm2"

" vim-gitgutter
map <Leader>gb :Git blame<CR>

" ngmy/vim-rubocop
let g:vimrubocop_rubocop_cmd = 'bundle exec rubocop '
nnoremap <leader>r :RuboCop -A<cr>
