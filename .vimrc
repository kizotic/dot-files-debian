" force solid block cursor on startup and when entering a window
autocmd VimEnter,WinEnter * silent !echo -ne "\e[2 q"

" redraw screen when vim launches
autocmd VimEnter * redraw!

set nocompatible
set number " enable line number
syntax on " enable syntax
filetype plugin indent on " enable filetype detection
autocmd FileType * setlocal formatoptions -=cro " remove auto commenting on next line
colorscheme slate

set hlsearch " enable highlighting of all matches
hi MatchParen cterm=none ctermbg=white ctermfg=red " ()
set incsearch " highlight matches as you type
set ignorecase " ignore case...
set smartcase " ...unless the query contains an uppercase letter

" tab stops
set tabstop=4       " number of spaces a tab counts for
set shiftwidth=4    " number of spaces used for autoindent
set softtabstop=4   " number of spaces when hitting <Tab> in insert mode
set expandtab       " use spaces instead of actual tab characters

" tab stops for js
autocmd FileType javascript setlocal shiftwidth=2 tabstop=2 softtabstop=2 expandtab

set wrap " wrap long lines at the edge of screen
set linebreak " wrap long lines at word boundaries, rather than splitting words in half
set breakindent " reserve indentation of original line when wrapping

nnoremap <Leader>o o<Esc> " add line below without entering Insert
nnoremap <Leader>O O<Esc> " add line above without entering Insert
nnoremap <Leader>w :w<CR> " write

" set cursor shape for different modes in terminal
let &t_SI = "\e[6 q" " SI = Insert mode (Beam)
let &t_SR = "\e[4 q" " SR = Replace mode (Underline)
let &t_EI = "\e[2 q" " EI = Normal mode (Block)

" reset cursor to beam when exiting Vim back to Bash
autocmd VimLeave * silent !echo -ne "\e[6 q"

" plugins
call plug#begin('~/.vim/plugged')
" syntax highlighting
Plug 'sheerun/vim-polyglot'
" comment toggling
Plug 'tpope/vim-commentary'
" vim surround
Plug 'tpope/vim-surround'
call plug#end()

" customize netrw
" use tree-style listing
let g:netrw_liststyle = 3
" open vertical splits to the right
let g:netrw_altv = 1
" show hidden files
let g:netrw_list_hide = ''
" vertical split netrw
nnoremap <Leader>n :Hexplore<CR>
" horizontal split netrw
nnoremap <Leader>N :Vexplore<CR>

" sudo write
cabbrev w!! w !sudo tee %

" pressing Escape twice clears the search highlight
nnoremap <esc><esc> :noh<return><esc>

" Enable backup and undo persistence
set backup
set undofile

" Consolidate all temporary files into one location
" set backupdir=~/.vim/temp/backup//
" set directory=~/.vim/temp/swap//
" set undodir=~/.vim/temp/undo//

" optional: Keep the backup even after the file is successfully saved
set writebackup
