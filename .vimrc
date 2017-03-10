"
" .vimrc
"
" Various sources, some stuff taken from
" https://github.com/sjl/dotfiles/blob/master/vim/vimrc
"


set nocompatible
set t_Co=256
set encoding=utf-8		" Necessary to show unicode glyphs
colorscheme mustang "wombat slate solarized
syntax enable

"Allign unnamed register with system clipboard
set clipboard=unnamed

"Load Pathogen
call pathogen#infect()

"Shortcut to auto indent entire file
"set autoindent
set showmatch
filetype plugin indent on
filetype on

set tabstop=4
set shiftwidth=4
"set softtabstop=4
set expandtab

"Relative line numbers when not in normal mode
autocmd InsertEnter * :set nonumber relativenumber
autocmd InsertLeave * :set number norelativenumber

"Don't loose selection when shifting left or right"
xnoremap <  <gv
xnoremap >  >gv

"Set the font and size
if has("unix")
	let s:uname = system("uname")
	if s:uname == "Darwin\n"
        "set guifont=Monaco:h12
		"set noantialias
		set guifont=Envy\ Code\ R\ for\ Powerline:h13 "Doesn't look good on Lion
	else
		set guifont=Envy\ Code\ R\ for\ Powerline
	endif
endif

"Hide toolbar
if has("gui")
	set guioptions-=T
	set go-=l
	set go-=L
	set go-=r
	set go-=R
	" Different cursors for different modes.
	"set guicursor=n-c:block-Cursor-blinkon0
	"set guicursor+=v:block-vCursor-blinkon0
	"set guicursor+=i-ci:ver20-iCursor
	set lines=40
	set columns=135
endif

if has("gui_macvim")
	" Full screen means FULL screen
	set fuoptions=maxvert,maxhorz
endif

set ruler

set incsearch
set ignorecase

set virtualedit=all

"Have 3 lines of offset (or buffer) when scrolling
set scrolloff=3

"Set line numbering to take up 5 spaces
set numberwidth=3		"Highlight current line
set number

set nobackup
set nowb
set noswapfile

"Fixes delete in insert mode on some *nix
set backspace=indent,eol,start

"No more needed with powerline
"set statusline=\ %F%m%r%h\ %w\ \ \ Line:\ %l/%L:%c

set pastetoggle=<F2>
nnoremap <F3> :NumbersToggle<CR>

if version>= 600
	set foldenable
	set foldmethod=marker
endif

set history=1000         " remember more commands and search history
set undolevels=1000      " use many muchos levels of undo

"Arrows to nop
"map <up> <nop>
"map <down> <nop>
"map <left> <nop>
"map <right> <nop>

" Easy window navigation
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

" w!! to write if readonly
cmap w!! w !sudo tee % >/dev/null  

let mapleader=","       " change the leader to be a comma vs slash

" Very magic mode search/replace with confirmation
" Hit ,/ type the search term(in very magic mode), then 
" / followed by the replacement string
nnoremap <leader>/ :%s/\v/gc<Left><Left><Left>

" Keep search matches in the middle of the window.
nnoremap n nzzzv
nnoremap N Nzzzv
" Same when jumping around
nnoremap g; g;zz
nnoremap g, g,zz

"Spellcheck
" shortcut to toggle spelling
" en_US, en_GB, it_IT
nmap <leader>s :setlocal spell! spelllang=en_us<CR>
" setup a custom dict for spelling
" zg = add word to dict
" zw = mark word as not spelled correctly (remove)
"set spellfile=~/.vim/en_US.dic

"Indent highlight
let g:indentguides_state = 0
 function! IndentGuides() " {{{
	if g:indentguides_state
		let g:indentguides_state = 0
		2match None
	else
		let g:indentguides_state = 1
		execute '2match IndentGuides /\%(\_^\s*\)\@<=\%(\%'.(0*&sw+1).'v\|\%'.(1*&sw+1).'v\|\%'.(2*&sw+1).'v\|\%'.(3*&sw+1).'v\|\%'.(4*&sw+1).'v\|\%'.(5*&sw+1).'v\|\%'.(6*&sw+1).'v\|\%'.(7*&sw+1).'v\)\s/'
	endif
endfunction " 
hi def IndentGuides guibg=#303030
nnoremap <leader>I :call IndentGuides()<cr>


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"
"						PLUGINS
"
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


"vim-airline
set laststatus=2		" Always show the statusline
let g:airline_powerline_fonts=1
let g:airline_theme='wombat'
set ttimeoutlen=50

let g:ctrlp_map = '<c-p>'
"let g:ctrlp_dont_split = 'NERD_tree_1'
let g:ctrlp_jump_to_buffer = 0
let g:ctrlp_working_path_mode = 0
"let g:ctrlp_working_path_mode = 2
let g:ctrlp_match_window_reversed = 1
let g:ctrlp_split_window = 0
let g:ctrlp_max_height = 20
let g:ctrlp_extensions = ['tag']

"NerdTree, use netrw 
"noremap <leader>1 :NERDTreeToggle<CR>

"TagList
"ctags default tagfile
set tags=tags;/
nnoremap <leader>2 :TlistToggle<CR>

"Ack
let g:ackprg="ack-grep -H --nocolor --nogroup --column"
nnoremap <leader>3 :Ack

"Syntastic

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

let g:syntastic_c_compiler = "clang"
let g:syntastic_c_compiler_options = "-Weverything" " -Wall -Werror

let g:syntastic_swift_checkers = ['swiftpm', 'swiftlint']

 

"""""""""""""""""""" HEX MODE

nnoremap <leader>4 :Hexmode<CR>

" ex command for toggling hex mode - define mapping if desired
command -bar Hexmode call ToggleHex()

" helper function to toggle hex mode
function ToggleHex()
  " hex mode should be considered a read-only operation
  " save values for modified and read-only for restoration later,
  " and clear the read-only flag for now
  let l:modified=&mod
  let l:oldreadonly=&readonly
  let &readonly=0
  let l:oldmodifiable=&modifiable
  let &modifiable=1
  if !exists("b:editHex") || !b:editHex
    " save old options
    let b:oldft=&ft
    let b:oldbin=&bin
    " set new options
    setlocal binary " make sure it overrides any textwidth, etc.
    let &ft="xxd"
    " set status
    let b:editHex=1
    " switch to hex editor
    %!xxd
  else
    " restore old options
    let &ft=b:oldft
    if !b:oldbin
      setlocal nobinary
    endif
    " set status
    let b:editHex=0
    " return to normal editing
    %!xxd -r
  endif
  " restore values for modified and read only state
  let &mod=l:modified
  let &readonly=l:oldreadonly
  let &modifiable=l:oldmodifiable
endfunction


" Toggle Vexplore with ,1
function! ToggleVExplorer()
  if exists("t:expl_buf_num")
      let expl_win_num = bufwinnr(t:expl_buf_num)
      if expl_win_num != -1
          let cur_win_nr = winnr()
          exec expl_win_num . 'wincmd w'
          close
          exec cur_win_nr . 'wincmd w'
          unlet t:expl_buf_num
      else
          unlet t:expl_buf_num
      endif
  else
      exec '1wincmd w'
      Vexplore
      let t:expl_buf_num = bufnr("%")
  endif
endfunction
map <silent> <leader>1 :call ToggleVExplorer()<CR>

" Hit enter in the file browser to open the selected
" file with :vsplit to the right of the browser.
let g:netrw_browse_split = 2
let g:netrw_altv = 1

" Default to tree mode
"let g:netrw_liststyle=3

" Change directory to the current buffer when opening files.
set autochdir







