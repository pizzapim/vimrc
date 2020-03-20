" autocmd StdinReadPre * let s:std_in=1
set hidden
set hid

" Disable any keybindings using esc
set noesckeys

filetype plugin on
set backspace=2

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
Plug 'christoomey/vim-tmux-navigator'
Plug 'benmills/vimux'
Plug 'nvie/vim-flake8'
Plug 'mhinz/vim-mix-format'
Plug 'udalov/kotlin-vim'
Plug 'Yggdroot/indentLine'

call plug#end()

let g:ale_lint_on_text_changed = 'never'
let g:ale_sign_column_always = 1
let g:ale_sign_error = '!!'
let g:ale_sign_warning = '??'

let g:ale_linters = {'python': ['flake8']}
" let g:ale_linters.elixir = ['elixir-ls']

" let g:ale_fixers = {'*': ['remove_trailing_lines', 'trim_whitespace']}
" let g:ale_fixers.elixir = ['mix_format']

" let g:ale_elixir_elixir_ls_release = '/home/pizzapim/apps/elixir-ls/rel'

" Format elixir on save.
" let g:mix_format_on_save = 1

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
set cursorline
hi CursorLine cterm=none guibg=Grey40
hi CursorLineNr gui=bold guifg=DarkRed guibg=#c0d0e0
highlight CursorLineNR ctermbg=black ctermfg=white



" Set leader key.
let mapleader = "\<Space>"

" Vimux config
map <Leader>vp :VimuxPromptCommand<CR>
map <Leader>vl :VimuxRunLastCommand<CR>
map <Leader>vt :VimuxRunCommand("pdflatex " . bufname("%") . " && xdg-open " . expand('%:t:r') . ".pdf")<CR>
let g:VimuxOrientation = "h"
let g:VimuxPromptString = "$ "

" Set line length marker
set colorcolumn=80

" Set ctags tags file
set tags=.git/tags

" Indent guide settings
" let g:indentguides_spacechar = '│'
" let g:indentguides_toggleListMode = 0

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

let g:airline_theme='minimalist'
let g:airline#extensions#tabline#formatter = 'unique_tail_improved'
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#show_tabs = 1
let g:airline#extensions#tabline#show_tab_count = 0
let g:airline#extensions#tabline#tab_nr_type = 1

" Settings for using buffers
map gn :bn<cr>
map gp :bp<cr>
map gd :bd<cr>
nmap <leader>b :Buffers<CR>

" Settings for using tabs
map tn :tabn<cr>
map tp :tabp<cr>
map td :tabd<cr>

" Scroll when near top or bottom of screen
set scrolloff=12

autocmd! bufreadpost *.md set syntax=off

if v:version >= 700
  au BufLeave * let b:winview = winsaveview()
  au BufEnter * if(exists('b:winview')) | call winrestview(b:winview) | endif
endif

nnoremap <Leader>a :Ack!<Space>

" Ruby fixes
let g:ruby_path = system('$HOME/.asdf/shims')
set regexpengine=1

let g:indentLine_setConceal = 2
let g:indentLine_concealcursor = ""
let g:indentLine_char = "┊"
