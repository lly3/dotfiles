let PATH = $HOME."/.vim/pack/tpope/start" " Path to plugins directory

" Create plugins directory
if !isdirectory(PATH)
	call mkdir(PATH, "p")
endif

" Git fugitive plugins
if !isdirectory(PATH."/fugitive")
  call mkdir(PATH."/fugitive")
  call system("git clone https://github.com/tpope/vim-fugitive ".PATH."/fugitive")
endif

" Vim-lsc plugins
if !isdirectory(PATH."/vim-lsc")
  call mkdir(PATH."/vim-lsc")
  call system("git clone https://github.com/natebosch/vim-lsc ".PATH."/vim-lsc")
endif

" vim-polyglot plugins (syntax support)
if !isdirectory(PATH."/vim-polyglot")
	call mkdir(PATH."/vim-polyglot")
	call system("git clone --depth 1 https://github.com/sheerun/vim-polyglot ".PATH."/vim-polyglot")
endif

" blade.php systex support
if !isdirectory(PATH."/vim-blade")
  call mkdir(PATH."/vim-blade")
  call system("git clone https://github.com/jwalton512/vim-blade ".PATH."/vim-blade")
endif

" UltiSnips plugins (snippet engine)
if !isdirectory(PATH."/ultisnips")
	call mkdir(PATH."/ultisnips")
	call system("git clone https://github.com/SirVer/ultisnips ".PATH."/ultisnips")
endif

" vim-snippets plugins (more snippets)
if !isdirectory(PATH."/vim-snippets")
	call mkdir(PATH."/vim-snippets")
	call system("git clone https://github.com/honza/vim-snippets ".PATH."/vim-snippets")
endif

" vim-fzf plugins 
if !isdirectory(PATH."/vim-fzf")
	call mkdir(PATH."/vim-fzf")
	call system("git clone https://github.com/junegunn/fzf.vim ".PATH."/vim-fzf")
endif

" Create colorscheme directory
if !isdirectory($HOME."/.vim/colors")
  call mkdir($HOME."/.vim/colors")
endif

if !filereadable($HOME."/.vim/colors/gruvbox.vim")
  call system("wget https://raw.githubusercontent.com/morhetz/gruvbox/master/colors/gruvbox.vim -P ".$HOME."/.vim/colors/")
endif

if !filereadable($HOME."/.vim/colors/nord.vim")
  call system("wget https://raw.githubusercontent.com/arcticicestudio/nord-vim/main/colors/nord.vim -P ".$HOME."/.vim/colors/")
endif

syntax on
set mouse=a
set relativenumber
set wildmenu
set hlsearch
set background=dark
let g:gruvbox_contrast_dark='hard'
colorscheme nord
hi Normal guibg=NONE ctermbg=NONE

set laststatus=2

set statusline=
set statusline+=%#PmenuThumb#
set statusline+=\ %.40F
set statusline+=%=
set statusline+=%m
set statusline+=\ 
set statusline+=FileType:%y
set statusline+=\ 
set statusline+=Ln:\ %3l/%L

" split navigation
nnoremap <C-j> <C-W>j
nnoremap <C-k> <C-W>k
nnoremap <C-h> <C-W>h
nnoremap <C-l> <C-W>l

nnoremap <C-d> M<C-d>
nnoremap <C-u> M<C-u>

" omni func
set omnifunc=syntaxcomplete#Complete

let mapleader = "-"
let maplocalleader = "\\"
" mapping
noremap <leader>c I//<esc>
" movement
onoremap ( i(
onoremap { i{
onoremap " i"
onoremap ' i'
onoremap w iw
" netrw
let g:netrw_banner = 0 " netrw banner
let g:netrw_liststyle = 3 " show tree listing style
let g:netrw_preview = 1 " open split on right side

augroup filetype_netrw
  autocmd!
  autocmd FileType netrw setl bufhidden=delete
augroup END


" handle each filetype
augroup filetype_javascript
  autocmd!
  autocmd FileType javascript noremap <buffer> <localleader>c I//<esc>
augroup END
augroup filetype_java
  autocmd!
  autocmd FileType java setlocal tabstop=4 
  autocmd FileType java setlocal shiftwidth=4 
  autocmd FileType java setlocal expandtab
augroup END
augroup filetype_css
  autocmd!
  autocmd FileType css noremap <buffer> <localleader>c I//<esc>
augroup END
augroup filetype_html
  autocmd!
  autocmd FileType html noremap <buffer> <localleader>c I//<esc>
augroup END
augroup filetype_python
  autocmd!
  autocmd FileType python noremap <buffer> <localleader>c I#<esc>
  autocmd FileType python setlocal makeprg=python\ %:p
  autocmd FileType python compiler pyunit
augroup END
augroup filetype_vim
  autocmd!
  autocmd FileType vim noremap <buffer> <localleader>c I"<esc>
augroup END
augroup filetype_blade
  autocmd!
  autocmd FileType blade UltiSnipsAddFiletype blade
  autocmd FileType blade UltiSnipsAddFiletype html
augroup END

" language server config
let g:lsc_server_commands = {
  \ 'javascript': {
  \   'command': 'typescript-language-server --stdio',
  \   'log_level': -1,
  \   'suppress_stderr': v:true
  \ },
  \ 'rust' : 'rls',
  \ 'java' :  {
  \   'command': '/usr/java/jls/java-language-server/dist/lang_server_linux.sh',
  \   'suppress_stderr': v:true
  \ },
  \ 'php': {
  \   'command': 'intelephense --stdio',
  \     'message_hooks': {
  \       'initialize': {
  \         'initializationOptions': {'storagePath': '/tmp/intelephense'},
  \       },
  \     },
  \ },
  \ 'html': 'html-languageserver --stdio',
  \ 'css': 'css-languageserver --stdio'
 \}
" let g:lsc_auto_map = v:true
let g:lsc_auto_map = {
 \  'GoToDefinition': 'gf',
 \  'FindReferences': 'gr',
 \  'Rename': 'gR',
 \  'ShowHover': 'K',
 \  'FindCodeActions': 'ga',
 \  'Completion': 'omnifunc',
 \}
let g:lsc_enable_autocomplete = v:false
let g:lsc_enable_diagnostics = v:false
let g:lsc_reference_highlights = v:false
set completeopt=menu,menuone,noinsert,noselect

" polyglot plugins
let g:polyglot_disabled = ['sensible']
let g:polyglot_disabled = ['ftdetect']

" vim-snippet(UltiSnips)
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<S-tab>"

" fzf.vim
let g:fzf_layout = { 'down': '~40%' }
noremap <silent><C-p> :GFiles<CR>
nnoremap <silent><leader>l :Buffers<CR>
