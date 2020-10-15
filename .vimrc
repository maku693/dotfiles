" General
set autoread
set ttyfast
set lazyredraw

" Editing
set autoindent
set backspace=indent,eol,start
set cinoptions=:0g0N-sE-s(0
set encoding=utf-8
set expandtab
set iminsert=0
set imsearch=-1
set shiftwidth=2
set smarttab
set tabstop=2

" UI
set ambiwidth=double
set clipboard=unnamed
set diffopt=filler,vertical
set foldcolumn=1
set hidden
set langnoremap
set laststatus=2
set mouse=a
set scrolloff=5
set sidescrolloff=5
set showcmd
set whichwrap+=b,s,h,l,[,],<,>
set wildmenu

" Status line
set laststatus=2
set statusline=%<%f\ %m%r%h%w
set statusline+=%=%l:%c
set statusline+=\ [%{&fenc!=''?&fenc:&enc}][%{&ff}]

" Search
set hlsearch
set incsearch
set ignorecase
set smartcase

" Backup/Swap/Undo files
set nobackup
set noswapfile
set noundofile

" Completion
set omnifunc=syntaxcomplete#Complete

" Plugin options
let g:loaded_netrwPlugin = 1
if executable("rg")
  let g:ackprg = 'rg --vimgrep'
endif

" Syntax
colorscheme usual
syntax on

" autocmds
augroup vimrc
  autocmd!

  " FileType specific settings
  autocmd FileType go setlocal noexpandtab
  autocmd FileType make setlocal noexpandtab

  " Remember last position
  autocmd BufWinLeave ?* if &modifiable | mkview | endif
  autocmd BufWinEnter ?* if &modifiable | loadview | endif
augroup END

" Keymaps
" Clear highlights
nnoremap <silent> <CR> :<C-U>noh<CR><CR>
" Move around wraped lines
noremap <silent> j gj
noremap <silent> k gk
noremap <silent> 0 g0
noremap <silent> ^ g^
noremap <silent> $ g$
" Terminal-normal mode
tnoremap <silent> <C-W><ESC> <C-W>N

" Platform specific settings
if has('win32')
  set viewdir=$HOME/vimfiles/view
endif
