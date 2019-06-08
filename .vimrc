" autocmd StdinReadPre * let s:std_in=1
set hidden
set hid

" Disable any keybindings using esc
set noesckeys

" Open nerdtree with shortcut
map <C-e> :NERDTreeToggle<CR>

" Download plug.vim if it is not installed
if empty(glob('~/.vim/autoload/plug.vim'))
 silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
   \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
 autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')

Plug 'w0rp/ale'
Plug 'thaerkh/vim-indentguides'
Plug 'croaker/mustang-vim'
Plug 'scrooloose/nerdtree'
Plug 'vim-scripts/grep.vim'
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-commentary'
Plug '~/.fzf'
Plug 'junegunn/fzf.vim'
Plug 'mileszs/ack.vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'elixir-editors/vim-elixir'
Plug 'justinmk/vim-sneak'
Plug 'christoomey/vim-tmux-navigator'
Plug 'benmills/vimux'

call plug#end()

let g:ale_lint_on_text_changed = 'never'
let g:ale_sign_column_always = 1
let g:ale_sign_error = '!!'
let g:ale_sign_warning = '??'

let g:ale_linters = {}
let g:ale_linters.elixir = ['elixir-ls']

let g:ale_fixers = {'*': ['remove_trailing_lines', 'trim_whitespace']}
let g:ale_fixers.elixir = ['mix_format']

let g:ale_elixir_elixir_ls_release = '/home/pizzapim/apps/elixir-ls/rel'

" Set softtabs and length.
set expandtab
set shiftwidth=2
set softtabstop=2
autocmd Filetype c setlocal expandtab tabstop=4 shiftwidth=4 softtabstop=4
autocmd Filetype javascript setlocal expandtab tabstop=2 shiftwidth=2 softtabstop=2

" Syntax dependent indenting.
set autoindent
set smartindent

" Remove trailing whitespace when saving.
autocmd BufWritePre * %s/\s\+$//e

" Set numbers in the gutter.
set number

colorscheme mustang

" Set leader key.
let mapleader = "\<Space>"
map <Leader>vp :VimuxPromptCommand<CR>
map <Leader>vl :VimuxRunLastCommand<CR>

" Set line length marker
set colorcolumn=80

" Set ctags tags file
set tags=.git/tags

" Indent guide settings
let g:indentguides_spacechar = '│'
let g:indentguides_toggleListMode = 0

" Disable arrow buttons
noremap <Up> <Nop>
noremap <Down> <Nop>
noremap <Left> <Nop>
noremap <Right> <Nop>

let g:fzf_colors =
\ { 'fg':      ['fg', 'Normal'],
 \ 'bg':      ['bg', 'Normal'],
 \ 'hl':      ['fg', 'Comment'],
 \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
 \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
 \ 'hl+':     ['fg', 'Statement'],
 \ 'info':    ['fg', 'PreProc'],
 \ 'border':  ['fg', 'Ignore'],
 \ 'prompt':  ['fg', 'Conditional'],
 \ 'pointer': ['fg', 'Exception'],
 \ 'marker':  ['fg', 'Keyword'],
 \ 'spinner': ['fg', 'Label'],
 \ 'header':  ['fg', 'Comment'] }

let g:fzf_layout = { 'down': '~60%' }

nmap <c-p> :Files<CR>
nmap <Leader>p :Tags<CR>

let g:airline_theme='lucius'
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#formatter = 'unique_tail_improved'
let g:airline#extensions#tabline#show_tabs = 0

" Settings for using buffers
map gn :bn<cr>
map gp :bp<cr>
map gd :bd<cr>
nmap <leader>b :Buffers<CR>

" Scroll when near top or bottom of screen
set scrolloff=12

autocmd! bufreadpost *.md set syntax=off
