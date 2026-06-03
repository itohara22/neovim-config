autocmd GUIEnter * simalt ~x
let mapleader = " "

set expandtab
set tabstop=4
set shiftwidth=4
set softtabstop=4
set autoindent
set clipboard=unnamed
set mouse=a
set selectmode=
set mousemodel=extend
set number
syntax on
colorscheme habamax
set guioptions-=T   " Disable toolbar
set guioptions-=m   " Disable menu bar
set guioptions-=r   " Disable right scrollbar
set guioptions-=L   " Disable left scrollbar

" Searching with ripgrep
set grepprg=rg\ --vimgrep\ --smart-case\ 
set grepformat=%f:%l:%c:%m

" Search settings
set ignorecase
set smartcase
set incsearch
set hlsearch 

" keymaps
inoremap jk <Esc>
inoremap kj <Esc>
nnoremap <Leader>fw :silent lgrep <C-R><C-W> <CR>:lopen<CR><C-L>
nnoremap <Leader>cd :lcd %:p:h<CR>:pwd<CR>
