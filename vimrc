" vimrc

" inclure la configuration par defaut.
"unlet! skip_defaults_vim
"source $VIMRUNTIME/defaults.vim

" {{{ Plugins

call plug#begin('~/.config/vim/plugged')

" Fonctionnalités
Plug 'itchyny/lightline.vim'        " Nouvelle barre de status
Plug 'mhinz/vim-startify'           " Nouveau écran d'acceuil
Plug 'ryanoasis/vim-devicons'       " Ajouter des icones
Plug 'scrooloose/nerdtree'          " Voir arborescence projet
Plug 'scrooloose/nerdcommenter'     " Dé/Commenter rapidement
Plug 'brooth/far.vim'               " Recherche
Plug 'tpope/vim-fugitive'           " Git support

" Syntaxe et langages
Plug 'w0rp/ale'                     " Syntaxe checker
Plug 'honza/vim-snippets'
Plug 'sheerun/vim-polyglot'
Plug 'ecomba/vim-ruby-refactoring'
Plug 'tpope/vim-rake'
"Plug 'tpope/vim-endwise'
"Plug 'jiangmiao/auto-pairs'

" Games
Plug 'johngrib/vim-game-code-break'

" Theme de couleurs
Plug 'dot-richard/minimaldark256'

call plug#end()
" }}}

" {{{ Configuration

let mapleader =  ','
colorscheme minimaldark256

for file in globpath('~/.vim/config', '*.vim', 0, 1)
    execute 'source' file
endfor

" interface general
set ruler
set number
set relativenumber
set cc=80
set guicursor=a:blink
set cursorline
set cursorcolumn
set signcolumn=auto
set foldmethod=marker
set foldcolumn=1
set noshowmatch
"let g:loaded_matchparen = 1     " desactiver les parenthèses

" status bar
set laststatus=2
set showcmd
set showmode

" support
set ttyfast
set clipboard=unnamedplus
set mouse=

" Indentation
set autoindent
set expandtab
set shiftwidth=4
set softtabstop=4
set smartindent

" Recherches
set showmatch
set hlsearch
set incsearch
set ignorecase
set smartcase

" Completions
filetype plugin indent on
set omnifunc=syntaxcomplete#Complete
set wildmenu
set wildmode=list:full,full
set wildignore=*.docx,*.jpg,*.png,*.gif,*.pdf,*.pyc,*.exe,*.flv,*.img,*.xlsx

" Caractères invisibles
set list
set listchars=tab:>-,trail:~,extends:>,precedes:<,nbsp:_
set fillchars=eob:~,fold:-,foldopen:+,foldclose:-

" Fichiers et buffers

set hidden
set undofile
set backup
set swapfile

" repertoire pour swap
if &swapfile
    let g:swap_dir='~/.vim/swaps'
    execute 'silent !mkdir -p' g:swap_dir . ' > /dev/null 2>&1'
    execute 'set directory^=' . g:swap_dir . '//'
endif

" repertoire pour backups
if &backup
    let g:back_dir='~/.vim/backups'
    execute 'silent !mkdir -p' g:back_dir . ' > /dev/null 2>&1'
    execute 'set backupdir^=' . g:back_dir . '//'
endif

" repertoire pour undos (historique d'annulation)
if &undofile
    let g:undo_dir='~/.vim/undos'
    execute 'silent !mkdir -p' g:undo_dir . ' > /dev/null 2>&1'
    execute 'set undodir^=' . g:undo_dir . '//'
endif

" }}}

" {{{ Mapping

" Arreter la surbrillance des recherches :
nnoremap <silent> <leader>n :nohlsearch<CR>

" }}}

" {{{ Autocmd

" Auto efface les queues d'espaces avant sauvegarde :
autocmd BufWritePre * %s/\s\+$//e

" Se souvenir de la dernière position du curseur
" Après fermeture et ré ouverture d'un fichier.
" from default.vim
augroup remember_cursor_position
    autocmd!
    autocmd BufReadPost *
    \ let line = line("'\"")
    \ | if line >= 1 && line <= line("$") && &filetype !~# 'commit'
    \      && index(['xxd', 'gitrebase'], &filetype) == -1
    \ |   execute "normal! g`\""
    \ | endif
augroup END

" }}}