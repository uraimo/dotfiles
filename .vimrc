set nocompatible
set t_Co=256
colorscheme mustang "wombat slate solarized
set background=dark
syntax enable

"Shortcut to auto indent entire file
set autoindent
set showmatch
filetype indent on

set tabstop=4
set shiftwidth=4
set softtabstop=4

"Set the font and size
set guifont=Envy\ Code\ R
"Hide toolbar
if has("gui")
	set guioptions-=T
	set lines=40
	set columns=135
endif
set ruler

set incsearch
set ignorecase

set virtualedit=all

"Have 3 lines of offset (or buffer) when scrolling
set scrolloff=3

"Set line numbering to take up 5 spaces
set numberwidth=3 "Highlight current line
set number

set nobackup
set nowb
set noswapfile

set statusline=\ %F%m%r%h\ %w\ \ \ Line:\ %l/%L:%c

"Load Pathogen
call pathogen#runtime_append_all_bundles()
call pathogen#helptags()

set pastetoggle=<F2>

if version>= 600
	set foldenable
	set foldmethod=marker
endif

set history=1000         " remember more commands and search history
set undolevels=1000      " use many muchos levels of undo

map <up> <nop>
map <down> <nop>
map <left> <nop>
map <right> <nop>

" Easy window navigation
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

" w!! to write if readonly
cmap w!! w !sudo tee % >/dev/null  

let mapleader=","       " change the leader to be a comma vs slash

"Spellcheck
"set spell

" shortcut to toggle spelling
" en_US, en_GB, it_IT
nmap <leader>s :setlocal spell! spelllang=en_us<CR>

" setup a custom dict for spelling
" zg = add word to dict
" zw = mark word as not spelled correctly (remove)
"set spellfile=~/.vim/en_US.dic


"NerdTree
noremap <leader>1 :NERDTreeToggle<CR>

"TagBar
let g:tagbar_usearrows = 1
nnoremap <leader>2 :TagbarToggle<CR>

"Supertab
let g:SuperTabDefaultCompletionType = "context"

"Ack
let g:ackprg="ack-grep -H --nocolor --nogroup --column"
nnoremap <leader>3 :Ack


