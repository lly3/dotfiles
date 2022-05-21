syntax on
set mouse=a
set number
set wildmenu
set hlsearch

set laststatus=2

set statusline=
set statusline+=%.20F\ -\ FileType:%y\ %=Ln:\ %3l/%L

set fillchars+=vert:\ 

" narvigation
" normal mode map
nnoremap h k
nnoremap k j
nnoremap j h

" split navigation
nnoremap <C-j> <C-W>h
nnoremap <C-k> <C-W>j
nnoremap <C-h> <C-W>k
nnoremap <C-l> <C-W>l

 " visual mode
vnoremap h k
vnoremap k j
vnoremap j h

" omni func
set omnifunc=syntaxcomplete#Complete

let mapleader = "-"
let maplocalleader = "\\"
" mapping
inoremap ,. <esc>
inoremap <esc> <nop>
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

augroup filetype_javascript
  autocmd!
  autocmd FileType javascript noremap <buffer> <localleader>c I//<esc>
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
 \  'GoToDefinition': 'gd',
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
