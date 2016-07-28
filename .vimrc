" VIM CONFIGURATION

set nocompatible
filetype plugin indent on
syntax enable
colorscheme molokai
let g:rehash=1
let s:molokai_original = 1

" Plug
call plug#begin('~/.vim/plugged')
Plug 'Shougo/vimproc'
Plug 'Shougo/unite.vim'
Plug 'tpope/vim-fugitive'
Plug 'itchyny/lightline.vim'
Plug 'Valloric/YouCompleteMe'
Plug 'scrooloose/syntastic'
Plug 'easymotion/vim-easymotion'
Plug 'vim-scripts/YankRing.vim'
Plug 'sjl/gundo.vim'
Plug 'christoomey/vim-tmux-navigator'
Plug 'wellle/tmux-complete.vim'
Plug 'terryma/vim-multiple-cursors'
Plug 'LaTeX-Box-Team/LaTeX-Box'
Plug 'vimwiki/vimwiki'
" Plug 'jeaye/color_coded'
Plug 'mhinz/vim-startify'
call plug#end()

" mouse enable e esconde qnd digita
set mouse=a
set mousehide
set clipboard =unnamedplus
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
set display		=lastline
set t_ut=
set ttyfast lazyredraw
set showmode showcmd

" autocmds
autocmd FileType tex set spell spelllang=pt complete+=kspell wrap nonumber fileencoding=latin1
au FileType c,cpp,java set mps+==:;


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

" gVIM options
if has('gui_running')
	set guioptions-=T
	set gfn=Source\ Code\ Pro\ for\ Powerline\ 12.5
	let &t_SI = "\<Esc>]50;CursorShape=1\x7"
	let &t_EI = "\<Esc>]50;CursorShape=0\x7"
	let &t_SR = "\<Esc>]50;CursorShape=2\x7"
endif


" Unite
call unite#filters#matcher_default#use(['matcher_fuzzy'])
let g:unite_source_grep_command='ag'
let g:unite_force_overwrite_statusline=0
nnoremap <C-b> :Unite -quick-match buffer<cr>
nnoremap <C-t> :Unite -quick-match tab<cr>
nnoremap <C-p> :Unite -start-insert file_rec/async<cr>
nnoremap <C-f> :Unite -auto-preview file<cr>
let g:unite_source_menu_menus = {}
let g:unite_source_menu_menus.Finder = {
    \ 'description' : '',
    \}
let g:unite_source_menu_menus.Finder.command_candidates = [
	\	['Fuzzy finder', 'Unite -start-insert file_rec/async'],
	\	['File finder', 'Unite -start-insert file'],
	\	['Grep', 'Unite grep'],
	\	['Buffers', 'Unite -quick-match buffer'],
	\	['Tabs', 'Unite -quick-match tab'],
	\	['Bookmarks', 'Unite -quick-match bookmark'],
    \]
nnoremap <silent> <leader>f :Unite -silent -quick-match menu:Finder<CR>


" multiple-cursors
let g:multi_cursor_use_default_mapping=0
let g:multi_cursor_next_key='<leader>n'
let g:multi_cursor_prev_key='<leader>p'
let g:multi_cursor_skip_key='<leader>x'
let g:multi_cursor_quit_key='<Esc>'
highlight multiple_cursors_cursor term=reverse cterm=reverse gui=reverse
highlight link multiple_cursors_visual Visual

" yankring e gundo
let g:yankring_min_element_length = 2
nnoremap <silent> <leader>y :YRShow<CR>
nnoremap <F5> :GundoToggle<CR>
let g:gundo_right=1

" easymotion, vim tmux e startify
let g:EasyMotion_use_migemo=1
let g:EasyMotion_enter_jump_first=1
let g:tmux_navigator_save_on_switch=1
let g:startifu_list_order = [ ['MRU'], 'files', ['Bookmarks'], 'bookmarks', ['MRU'.getcwd()], 'dir' ]
let g:startify_bookmarks = [ {'t': '~/.tmux.conf'}, {'v': '~/.vimrc'}, {'z': '~/.zshrc'} ]

" latex
let g:livepreview_previewer = 'evince'
let g:LatexBox_latexmk_preview_continuously=1
let g:LatexBox_quickfix=2

" Lightline
let g:lightline = {
    \ 'colorscheme' : 'landscape',
    \ 'active': {
    \	'left': [ [ 'mode', 'paste' ], [ 'fugitive', 'readonly', 'filename',  'modified' ] ],
    \	'right': [ [ 'syntastic', 'lineinfo' ], ['percent'], [ 'fileencoding', 'filetype' ] ]
    \ },
	\ 'inactive': {
	\	'left': [ [ 'fugitive', 'readonly', 'filename', 'modified' ] ],
	\	'right': [ [ 'syntastic', 'lineinfo' ], [ 'percent'] ] },
	\ 'tabline': {
	\	'left': [ [ 'tabs' ] ] },
	\ 'tab': {
	\	'inactive': [ 'filename', 'modified' ] },
    \ 'component_function' : {
    \	'fugitive': 'LightLineFugitive',
	\	'readonly': 'LightLineReadonly',
    \	'filename': 'LightLineFilename',
	\	'modified': 'LightLineModified',
    \	'filetype': 'LightLineFiletype',
    \	'fileencoding': 'LightLineFileencoding',
    \	'mode': 'LightLineMode',
    \ },
    \ 'component_expand': {
    \	'syntastic': 'SyntasticStatuslineFlag',
    \ },
    \ 'component_type': {
    \	'syntastic': 'error', 
    \ },
    \ 'separator': { 'left': '', 'right': '' },
    \ 'subseparator': { 'left': '', 'right': '' }
    \ }

function! LightLineModified()
	return &ft =~ 'help' ? '' : &modified ? '+' : &modifiable ? '' : '-'
endfunction

function! LightLineReadonly()
	return &ft =~ 'help' ? '' : &readonly ? '' : ''
endfunction

function! LightLineFilename()
	let fname = expand('%:t')
	return fname =~ '__Gundo__' ? '' :
			\ &ft == 'unite' ? unite#get_status_string() : 
			\ ('' != fname ? fname : '[No Name]')
endfunction

function! LightLineFugitive()
	try
		if expand('%:t') !~? 'Gundo' && exists('*fugitive#head')
			let _ = fugitive#head()
			return strlen(_) ? ' '._ : ''
		endif
	catch
	endtry
	return ''
endfunction

function! LightLineFiletype()
	return winwidth(0) > 70 ? (strlen(&filetype) ? &filetype : 'no ft') : ''
endfunction

function! LightLineFileencoding()
	return winwidth(0) > 70 ? (strlen(&fenc) ? &fenc : &enc) : ''
endfunction

function! LightLineMode()
	let fname = expand('%:t')
	return fname == '__Gundo__' ? 'Gundo' :
			\ fname == '__Gundo_Preview__' ? 'Gundo Preview' :
			\ &ft == 'unite' ? 'Unite' :
			\ winwidth(0) > 60 ? lightline#mode() : ''
endfunction


" Syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_error_symbol = "✗"
let g:syntastic_warning_symbol = "⚠"
let g:syntastic_mode_map = { 'passive_filetypes': ['tex'] }

augroup AutoSyntastic
	autocmd!
	autocmd BufWritePost *.py, *.java, *.c, *.cpp call s:syntastic()
augroup END
function! s:syntastic()
	SyntasticCheck
	call lightline#update()
endfunction


