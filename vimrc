set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim

call vundle#begin()
Plugin 'gmarik/Vundle.vim'
Plugin 'tpope/vim-sensible'
Plugin 'tpope/vim-sleuth'
Plugin 'ntpeters/vim-better-whitespace'
Plugin 'vim-pandoc/vim-pandoc'
Plugin 'vim-pandoc/vim-pandoc-syntax'
Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'edkolev/tmuxline.vim'
Plugin 'edkolev/promptline.vim'
Plugin 'Shougo/unite.vim'
Plugin 'Shougo/vimproc.vim'
Plugin 'jiangmiao/auto-pairs'
Plugin 'Valloric/YouCompleteMe'
Plugin 'JuliaLang/julia-vim'
Plugin 'rust-lang/rust.vim'
Plugin 'Chiel92/vim-autoformat'
Plugin 'pangloss/vim-javascript'
Plugin 'cespare/vim-toml'
call vundle#end()

filetype plugin indent on

set t_Co=256
set et
set ts=4
set sw=4
set background=dark
let mapleader = ' '

nnoremap <leader>d :YcmCompleter GoTo<CR>

let g:ycm_key_list_select_completion = ['<C-n>', '<Down>']
let g:ycm_key_list_previous_completion = ['<C-p>', '<Up>']

let g:UltiSnipsExpandTrigger = "<Tab>"
let g:UltiSnipsJumpForwardTrigger = "<Tab>"
let g:UltiSnipsJumpBackwardTrigger = "<S-Tab>"

let g:javascript_conceal_function = "λ"

call unite#filters#matcher_default#use(['matcher_fuzzy'])
nnoremap <leader><space> :Unite -no-split -quick-match buffer<cr>
nnoremap <leader>o :Unite -no-split -start-insert file_rec/async<cr>
let g:unite_prompt = '>> '

let g:better_whitespace_filetypes_blacklist = ['unite']

let g:airline_powerline_fonts = 1
let g:airline_theme = 'powerlineish'

let g:pandoc#modules#disabled = ["folding"]

let g:ycm_rust_src_path = substitute(system('rustc --print sysroot'), '\n\+$', '', '') . '/lib/rustlib/src/rust/src'

set undofile                " Save undo's after file closes
set undodir=$HOME/.vim/undo " where to save undo histories
