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

" Create colorscheme directory
if !isdirectory($HOME."/.vim/colors")
  call mkdir($HOME."/.vim/colors")
endif

if !filereadable($HOME."/.vim/colors/gruvbox.vim")
  call system("wget https://raw.githubusercontent.com/morhetz/gruvbox/master/colors/gruvbox.vim -P ".$HOME."/.vim/colors/")
endif

syntax on
set mouse=a
set number
set wildmenu
set hlsearch
set background=dark
colorscheme gruvbox

set laststatus=2

set statusline=
set statusline+=%.40F
set statusline+=%=
set statusline+=%m
set statusline+=\ 
set statusline+=FileType:%y
set statusline+=\ 
set statusline+=Ln:\ %3l/%L

set fillchars+=vert:\ 


" narvigation
" normal mode map
nnoremap h gk
nnoremap k gj
nnoremap j h

" split navigation
nnoremap <C-j> <C-W>h
nnoremap <C-k> <C-W>j
nnoremap <C-h> <C-W>k
nnoremap <C-l> <C-W>l

" visual mode
vnoremap h gk
vnoremap k gj
vnoremap j h

" omni func
set omnifunc=syntaxcomplete#Complete

let mapleader = "-"
let maplocalleader = "\\"
" mapping
noremap ,. <esc>
inoremap ,. <esc>
noremap <leader>c I//<esc>
" movement
onoremap p i(
onoremap " i"

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
  autocmd FileType javascript set tabstop=2
  autocmd FileType javascript set shiftwidth=2
augroup END
augroup filetype_css
  autocmd!
  autocmd FileType css noremap <buffer> <localleader>c I//<esc>
  autocmd FileType css set tabstop=2
  autocmd FileType css set shiftwidth=2
augroup END
augroup filetype_html
  autocmd!
  autocmd FileType html noremap <buffer> <localleader>c I//<esc>
  autocmd FileType html set tabstop=2
  autocmd FileType html set shiftwidth=2
augroup END
augroup filetype_python
  autocmd!
  autocmd FileType python noremap <buffer> <localleader>c I#<esc>
  autocmd FileType python set makeprg=python\ %:p
  autocmd FileType python compiler pyunit
augroup END
augroup filetype_vim
  autocmd!
  autocmd FileType vim noremap <buffer> <localleader>c I"<esc>
augroup END

" language server config
let g:lsc_server_commands = {
 \ 'javascript': {
 \ 'command': 'typescript-language-server --stdio',
 \ 'log_level': -1,
 \ 'suppress_stderr': v:true
 \ }
 \}
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
