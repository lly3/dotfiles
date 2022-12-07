source $HOME/.config/nvim/vim-plug/plugins.vim
source $HOME/.config/nvim/vim-plug/coc-config.vim
"luafile $HOME/.config/nvim/lua/nvim-cmp-config/init.lua
"luafile $HOME/.config/nvim/lua/lsp-config/init.lua
luafile $HOME/.config/nvim/lua/lualine-config/init.lua

syntax on
set mouse=a
set number
set relativenumber
set wildmenu
set hlsearch
set encoding=utf-8
colorscheme nord
hi Visual ctermbg=8
" Selected item on CocMenu 
hi CocMenuSel ctermbg=8
set completeopt=menu,menuone,noselect
" hi Normal guibg=NONE ctermbg=NONE

let mapleader = "-"
let maplocalleader = "\\"

let g:fzf_layout = { 'down': '~40%' }
noremap <silent><C-p> :GFiles<CR>
nnoremap <silent><leader>l :Buffers<CR>

nnoremap <C-t> :NERDTreeToggle<CR>

command Config edit $HOME/.config/nvim/init.vim
command Notes edit $HOME/notes/

"let g:UltiSnipsExpandTrigger="<c-j>"
"let g:UltiSnipsJumpBackwardTrigger="<c-k>"
