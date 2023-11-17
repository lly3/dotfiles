source $HOME/.config/nvim/vim-plug/plugins.vim
source $HOME/.config/nvim/vim-plug/coc-config.vim
"luafile $HOME/.config/nvim/lua/nvim-cmp-config/init.lua
"luafile $HOME/.config/nvim/lua/lsp-config/init.lua
luafile $HOME/.config/nvim/lua/lualine-config/init.lua
luafile $HOME/.config/nvim/lua/treesitting-config/init.lua

set termguicolors 
let ayucolor="dark" 
colorscheme ayu
set mouse=a
set number
set relativenumber
set wildmenu
set hlsearch
set encoding=utf-8
set clipboard+=unnamedplus
set completeopt=menu,menuone,noselect
set tabstop=2
set shiftwidth=2
set expandtab

let mapleader = "-"
let maplocalleader = "\\"

" Commands: "{{{
" ----------------------------------------------------------------------------
"
command Config edit $HOME/.config/nvim/init.vim
command Notes edit $HOME/notes/
"}}}

" Languages Setting: "{{{
" ----------------------------------------------------------------------------
"
autocmd FileType go call GoLang_settings()

function! GoLang_settings()
  setlocal tabstop=4
  setlocal shiftwidth=4
  " auto format on save
  autocmd BufWritePost *.go :silent :!go fmt %
  " auto import missing packages on save
  autocmd BufWritePre *.go :silent :call CocAction('runCommand', 'editor.action.organizeImport')
endfunction
"}}}

" Plugins Mapping:"{{{
" ----------------------------------------------------------------------------
"
" fzf
" -------------------
"let g:fzf_layout = { 'down': '~40%' }
"noremap <silent><C-p> :GFiles<CR>
"nnoremap <silent><leader>l :Buffers<CR>

" NERDTree
" -------------------
nnoremap <C-t> :NERDTreeToggle<CR>

" UltiSnips
" -------------------
let g:UltiSnipsExpandTrigger="<c-j>"
let g:UltiSnipsJumpBackwardTrigger="<c-k>"

" Telescope
" -------------------
nnoremap <silent><C-p> <cmd>Telescope find_files<cr>
nnoremap <leader>g <cmd>Telescope live_grep<cr>
nnoremap <leader>l <cmd>Telescope buffers<cr>
nnoremap <leader>h <cmd>Telescope help_tags<cr>
"}}}
