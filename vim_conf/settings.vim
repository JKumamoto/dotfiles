" mouse enable e esconde qnd digita
set mouse=a
set mousehide
set clipboard+=unnamedplus
set number
set nowrap
set tabstop=4 shiftwidth=4 noexpandtab
set autoindent
set shiftround
set incsearch hlsearch
set ignorecase smartcase
set showmatch matchtime=3
set cpoptions-=m
set matchpairs+=<:>
set cursorline
set splitbelow splitright
set hidden
set laststatus=2
if !&scrolloff
  set scrolloff=3       " Show next 3 lines while scrolling.
endif
if !&sidescrolloff
  set sidescrolloff=5   " Show next 5 columns while side-scrolling.
endif
set display+=lastline
set t_ut=
set ttyfast lazyredraw
set showmode showcmd
if(&relativenumber == 1)
	set nornu
	set number
else
	set rnu
endif

" neovim and gVIM options
if has('gui_running')
	set guioptions-=T
	set gfn=Source\ Code\ Pro\ for\ Powerline\ 12.5
	let &t_SI = "\<Esc>]50;CursorShape=1\x7"
	let &t_EI = "\<Esc>]50;CursorShape=0\x7"
	let &t_SR = "\<Esc>]50;CursorShape=2\x7"
endif
if has('nvim')
	let $NVIM_TUI_ENABLE_CURSOR_SHAPE = 1
	nnoremap <M-x> :split +terminal<CR>
	tnoremap <Esc> <C-\><C-n>
	tnoremap <C-j> <C-\><C-n><C-j>
	tnoremap <C-k> <C-\><C-n><C-k>
	tnoremap <C-h> <C-\><C-n><C-h>
	tnoremap <C-l> <C-\><C-n><C-l>
endif

" autocmds
autocmd FileType tex set spell spelllang=pt complete+=kspell wrap nonumber fileencoding=latin1
au FileType c,cpp,java set mps+==:;
au FileType cuh set ft=cuda;

" mappings
noremap J <C-f>
noremap K <C-b>
nnoremap <leader>b :enew<cr>
nnoremap [b :bprevious<cr>
nnoremap ]b :bnext<cr>
nnoremap [B :bfirst<cr>
nnoremap ]B :blast<cr>
nnoremap <leader>t :tabnew<cr>
nnoremap [t :tabprevious<cr>
nnoremap ]t :tabnext<cr>
nnoremap [T :tabfirst<cr>
nnoremap ]T :tablast<cr>
nnoremap <expr> n 'Nn'[v:searchforward]
nnoremap <expr> N 'nN'[v:searchforward]
nnoremap Q @q
vnoremap <Esc> <C-c>
inoremap <Esc> <C-c>
inoremap <C-d>d <C-c>ddi
inoremap <C-d>$ <C-c>d$i
inoremap <M-S-h> <S-Left>
inoremap <M-S-l> <S-Right>
inoremap <M-S-k> <S-Up>
inoremap <M-S-j> <S-Down>
cnoremap <c-n>  <down>
cnoremap <c-p>  <up>



