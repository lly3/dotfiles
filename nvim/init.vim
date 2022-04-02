source ~/.config/nvim/vim-plug/plugins.vim
source ~/.config/nvim/vim-plug/nvim-cmp-config.vim
"source ~/.config/nvim/lsp-config.vim

"luafile ~/.config/nvim/lua/plugins/compe-config.lua
"luafile ~/.config/nvim/lua/plugins/lsp-config.lua
luafile ~/.config/nvim/lua/plugins/lualine.lua
luafile ~/.config/nvim/lua/plugins/nvim-cmp.lua
"luafile ~/.config/nvim/lua/plugins/treesitter.lua

set termguicolors
colorscheme embark
set cursorline 
set encoding=UTF-8
hi! Normal ctermbg=NONE guibg=NONE

set number relativenumber

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

" terminal mode map
tnoremap <ESC> <C-\><C-n>

" Snippets
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"
let g:UltiSnipsEditSplit="vertical"

" omni func enable
filetype plugin on
set omnifunc=syntaxcomplete#Complete
