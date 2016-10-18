Plug 'Valloric/YouCompleteMe', { 'do': './install.py --clang-completer' }

Plug 'sjl/gundo.vim'
nnoremap <F5> :GundoToggle<CR>
let g:gundo_right=1

" yankring
Plug 'vim-scripts/YankRing.vim'
let g:yankring_min_element_length = 2
nnoremap <silent> <leader>y :YRShow<CR>
if has('nvim')
	let g:yankring_history_dir = '$HOME/.config/nvim'
else
	let g:yankring_history_dir = '$HOME/.vim'
endif

" Syntastic
Plug 'scrooloose/syntastic'
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_error_symbol = "✗"
let g:syntastic_warning_symbol = "⚠"
let g:syntastic_mode_map = { 
	\ "mode" : "passive",
	\ "active_filetypes": [],
	\ "passive_filetypes": [] }

augroup AutoSyntastic
	autocmd!
	autocmd BufWritePost *.py, *.java, *.c, *.cpp call s:syntastic()
augroup END
function! s:syntastic()
	SyntasticCheck
	call lightline#update()
endfunction

" java-complete
Plug 'artur-shaik/vim-javacomplete2'
autocmd FileType java setlocal omnifunc=javacomplete#Complete

Plug 'tpope/vim-fugitive'

Plug 'majutsushi/tagbar'
nnoremap <F8> :TagbarToggle<CR>

Plug 'easymotion/vim-easymotion'
let g:EasyMotion_use_migemo=1
let g:EasyMotion_enter_jump_first=1

" Lightline
Plug 'itchyny/lightline.vim'
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

if has('nvim')
	Plug 'neomake/neomake'
	Plug 'bfredl/nvim-miniyank'
	autocmd! BufReadPost,BufWritePost * Neomake
	let g:neomake_serialize=1
	let g:neomake_serialize_abort_on_error=1
	map p <Plug>(miniyank-autoput)
	map P <Plug>(miniyank-autoPut)
endif

Plug 'christoomey/vim-tmux-navigator'
Plug 'wellle/tmux-complete.vim'
let g:tmux_navigator_save_on_switch=1

" multiple-cursors
Plug 'terryma/vim-multiple-cursors'
let g:multi_cursor_use_default_mapping=0
let g:multi_cursor_next_key='<M-n>'
let g:multi_cursor_prev_key='<M-p>'
let g:multi_cursor_skip_key='<M-s>'
let g:multi_cursor_quit_key='<Esc>'
highlight multiple_cursors_cursor term=reverse cterm=reverse gui=reverse
highlight link multiple_cursors_visual Visual

Plug 'LaTeX-Box-Team/LaTeX-Box'
let g:livepreview_previewer = 'evince'
let g:LatexBox_latexmk_preview_continuously=1
let g:LatexBox_quickfix=2

Plug 'rbgrouleff/bclose.vim'
Plug 'francoiscabrol/ranger.vim'
let g:ranger_open_new_tab=1

Plug 'vimwiki/vimwiki'

Plug 'rhysd/vim-grammarous'
let g:grammarous#use_vim_spelllang=1

Plug 'beloglazov/vim-online-thesaurus'

" Plug 'jeaye/color_coded'

Plug 'mhinz/vim-startify'
let g:startifu_list_order = [ ['MRU'], 'files', ['Bookmarks'], 'bookmarks', ['MRU'.getcwd()], 'dir' ]
let g:startify_bookmarks = [ {'p': '~/.vim/plugins.vim'}, {'s': '~/.vim/settings.vim'}, {'t': '~/.tmux.conf'}, {'v': '~/.vimrc'}, {'z': '~/.zshrc'} ]

