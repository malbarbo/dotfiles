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
call vundle#end()

set et
set ts=4
set sw=4
set t_Co=256

python from powerline.vim import setup as powerline_setup
python powerline_setup()
python del powerline_setup
