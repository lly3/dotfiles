call plug#begin('~/.config/nvim/autoload/plugged')

" Better Syntax Support
Plug 'sheerun/vim-polyglot'
Plug 'ryanoasis/vim-devicons'

" Auto pairs for '(' '[' '{'
Plug 'jiangmiao/auto-pairs'

" Lua line
Plug 'nvim-lualine/lualine.nvim'

" Auto complete
Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/nvim-cmp'

" Theme
Plug 'matsuuu/pinkmare'
Plug 'joshdick/onedark.vim'
Plug 'arcticicestudio/nord-vim'
Plug 'embark-theme/vim', { 'as': 'embark', 'branch': 'main' }
Plug 'morhetz/gruvbox'

" Snippets
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'quangnguyen30192/cmp-nvim-ultisnips'

" fzf
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

" start munu
Plug 'mhinz/vim-startify'
call plug#end()
