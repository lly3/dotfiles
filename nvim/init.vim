source ~/AppData/Local/nvim/vim-plug/plugins.vim 
source ~\AppData\Local\nvim\statusline.vim


"" Important!!
"        if has('termguicolors')
"          set termguicolors
"        endif
"        " The configuration options should be placed before `colorscheme sonokai`.
"        let g:sonokai_style = 'maia'
"        let g:sonokai_enable_italic = 1
"        let g:sonokai_disable_italic_comment = 1
"        colorscheme sonokai
"if (has("autocmd") && !has("gui_running"))
"    augroup colorset
"        autocmd!
"        let s:white = { "gui": "#ABB2BF", "cterm": "145", "cterm16" : "7"  }
"        autocmd ColorScheme * call onedark#set_highlight("Normal", { "fg": s:white  }) " `bg` will not be styled since there is no `bg` setting
"    augroup END
"endif

set termguicolors
colorscheme nord
set cursorline 
set encoding=UTF-8
hi! Normal ctermbg=NONE guibg=NONE

set mouse=a
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

