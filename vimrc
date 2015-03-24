set nocompatible
set rtp+=~/.vim/bundle/Vundle.vim

call vundle#begin()
Plugin 'gmarik/Vundle.vim'
Plugin 'tpope/vim-sensible'
Plugin 'tpope/vim-sleuth'
Plugin 'vim-pandoc/vim-pandoc'
Plugin 'vim-pandoc/vim-pandoc-syntax'
Plugin 'Valloric/YouCompleteMe'
Plugin 'ntpeters/vim-better-whitespace'
Plugin 'JuliaLang/julia-vim'
Plugin 'wting/rust.vim'
Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'
Plugin 'pangloss/vim-javascript'
Plugin 'bling/vim-airline'
Plugin 'edkolev/tmuxline.vim'
Plugin 'edkolev/promptline.vim'
Plugin 'Shougo/unite.vim'
Plugin 'Shougo/vimproc.vim'
call vundle#end()

set t_Co=256
set et
set ts=4
set sw=4
set background=dark
let mapleader = ' '

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
