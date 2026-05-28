inoremap jk <Esc>
inoremap kj <Esc>
set clipboard=unnamedplus
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
if executable('rg')
    set grepprg=rg\ --vimgrep\ --smart-case\ 
    set grepformat=%f:%l:%c:%m
endif

" Search settings
set ignorecase
set smartcase
set incsearch
set hlsearch
