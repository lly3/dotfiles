source $HOME/.config/nvim/vim-plug/plugins.vim
source $HOME/.config/nvim/vim-plug/coc-config.vim
luafile $HOME/.config/nvim/lua/lualine-config/init.lua

syntax on
set mouse=a
set number
set relativenumber
set wildmenu
set hlsearch
set encoding=utf-8
colorscheme nord
" hi Normal guibg=NONE ctermbg=NONE

nnoremap <C-j> <C-W>j
nnoremap <C-k> <C-W>k
nnoremap <C-h> <C-W>h
nnoremap <C-l> <C-W>l

let mapleader = "-"
let maplocalleader = "\\"

let g:fzf_layout = { 'down': '~40%' }
noremap <silent><C-p> :GFiles<CR>
nnoremap <silent><leader>l :Buffers<CR>

nnoremap <C-t> :NERDTreeToggle<CR>

command Config edit $HOME/.config/nvim/init.vim

let g:UltiSnipsExpandTrigger="<c-j>"
let g:UltiSnipsJumpBackwardTrigger="<c-k>"
