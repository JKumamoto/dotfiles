Plug 'Valloric/YouCompleteMe', { 'do': './install.py --clang-completer' }
let g:ycm_complete_in_comments=1
let g:ycm_confirm_extra_conf=0
let g:ycm_collect_identifiers_from_tags_files=1
set completeopt-=preview
let g:ycm_cache_omnifunc=0
let g:ycm_seed_identifiers_with_syntax=1

" java-complete
"Plug 'artur-shaik/vim-javacomplete2'
"autocmd FileType java setlocal omnifunc=javacomplete#Complete

Plug 'sjl/gundo.vim'
nnoremap <leader>g :GundoToggle<CR>
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

Plug 'scrooloose/nerdtree'
map <C-f> :NERDTreeToggle<CR>
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'

Plug 'majutsushi/tagbar'
nnoremap <F5> :TagbarToggle<CR>

Plug 'easymotion/vim-easymotion'
let g:EasyMotion_use_migemo=1
let g:EasyMotion_enter_jump_first=1
" Jump to anywhere you want with minimal keystrokes, with just one key binding.
" `s{char}{label}`
nnoremap <leader>s <Plug>(easymotion-overwin-f)
" or
" `s{char}{char}{label}`
" Need one more keystroke, but on average, it may be more comfortable.
nnoremap <leader>s <Plug>(easymotion-overwin-f2)
" Turn on case insensitive feature
let g:EasyMotion_smartcase = 1
" JK motions: Line motions
nnoremap <Leader>j <Plug>(easymotion-j)
nnoremap <Leader>k <Plug>(easymotion-k)


Plug 'tpope/vim-fugitive'

"Plug 'benmills/vimux'
"nnoremap <Leader>vp :VimuxPromptCommand<CR>
"nnoremap <Leader>vm :VimuxPromptCommand("make ")<CR>
"nnoremap <Leader>vl :VimuxRunLastCommand<CR>
"nnoremap <Leader>vs :VimuxInterruptRunner<CR>


Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }

Plug 'jeaye/color_coded'
let g:color_coded_filetypes = ['c', 'cpp', 'cu', 'h', 'hpp']
" To get full highlighting, specify these in your colorscheme.
" See colors/twilighted.vim for example usage
"hi link StructDecl Type
"hi link UnionDecl Type
"hi link ClassDecl Type
"hi link EnumDecl Type


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
	return fname =~ '__Gundo\|NERD_tree' ? '' :
			\ ('' != fname ? fname : '[No Name]')
endfunction

function! LightLineFugitive()
	try
		if expand('%:t') !~? 'Tagbar\|Gundo\|NERD' && exists('*fugitive#head')
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
	return fname == '__Tagbar__' ? 'Tagbar' :
			\ fname == '__Gundo__' ? 'Gundo' :
			\ fname == '__Gundo_Preview__' ? 'Gundo Preview' :
			\ fname =~ 'NERD_tree' ? 'NERDTree' :
			\ winwidth(0) > 60 ? lightline#mode() : ''
endfunction

"let g:tagbar_status_func = 'TagbarStatusFunc'

"function! TagbarStatusFunc(current, sort, fname, ...) abort
"    let g:lightline.fname = a:fname
"  return lightline#statusline(0)
"endfunction


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

Plug 'vimwiki/vimwiki'

Plug 'rhysd/vim-grammarous'
let g:grammarous#use_vim_spelllang=1

Plug 'beloglazov/vim-online-thesaurus'


Plug 'mhinz/vim-startify'
let g:startifu_list_order = [ ['MRU'], 'files', ['Bookmarks'], 'bookmarks', ['MRU'.getcwd()], 'dir' ]
let g:startify_bookmarks = [ {'a': '~/.config/awesome/rc.lua'}, {'i': '~/.config/i3/config'}, {'p': '~/.vim/plugins.vim'}, {'s': '~/.vim/settings.vim'}, {'t': '~/.tmux.conf'}, {'v': '~/.vimrc'}, {'z': '~/.zshrc'} ]

