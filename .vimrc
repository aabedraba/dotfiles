set nocompatible              " be iMproved, required
filetype off                  " required

 " path to directory where library can be found
 let g:clang_library_path='/usr/lib/llvm-3.8/lib'
 " or path directly to the library file
 let g:clang_library_path='/usr/lib64/libclang.so.3.8'

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'git://git.wincent.com/command-t.git'
Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
Plugin 'scrooloose/nerdtree'

call vundle#end()            " required
filetype plugin indent on    " required

Plugin 'octol/vim-cpp-enhanced-highlight'
Plugin 'c.vim'
Plugin 'rip-rip/clang_complete'

