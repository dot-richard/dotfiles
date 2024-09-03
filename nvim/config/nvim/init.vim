" nvim/init.vim

" For use vim shared configuration

" Add ~./vim and ~/.vim/after to the list of directories
" to search for runtime files like filetype.vim, scripts.vim, etc:
set runtimepath=$VIMRUNTIME,~/.vim
"set runtimepath+=~/.vim/after

" Add the full runtime path to the list of directories
" to use to find Vim packages
let &packpath = &runtimepath

" Run vimrc
runtime! vimrc

