set nocompatible
filetype off

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

Bundle 'gmarik/vundle'

" Python and PHP Debugger
"Bundle 'fisadev/vim-debug.vim'
" Better file browser
Bundle 'scrooloose/nerdtree'
" Code commenter
Bundle 'scrooloose/nerdcommenter'
" " Search and read python documentation
" Autocompletition
Bundle 'AutoComplPop'
" Python code checker
Bundle 'pyflakes.vim'
" Consoles as buffers
Bundle 'rosenfeld/conque-term'
" Search and read python documentation
Bundle 'fs111/pydoc.vim'
" Powerline
Bundle 'Lokaltog/vim-powerline'
" " Class/module browser
Bundle 'majutsushi/tagbar'
" Pending tasks list
Bundle 'fisadev/FixedTaskList.vim'

set nobackup
set nu 
set tabstop=4
set shiftwidth=4
set expandtab
set smarttab
set background=dark
set fileencoding=utf-8
set fileencodings=utf-8,gb2312
set backspace=2
set fdm=indent
"默认情况下不折叠
set foldlevel=30
syntax enable
syntax on 
"colorscheme delek
colorscheme desert
function! SetTitle()
if &filetype == 'sh'
    call setline(1, "\#!/bin/bash")
    call setline(2, "\# ")
    call setline(3, "\# Author:       @.com")
    call setline(4, "\# ")
    call setline(5, "\# Created Time: ".strftime("%c"))
    call setline(6, "\# ")
    call setline(7, "\# FileName:     ".expand("%"))
    call setline(8, "\# ")
    call setline(9, "\# Description:  ")
    call setline(10, "\# ")
    call setline(11, "\# ChangeLog:")
elseif &filetype == 'python'
    call setline(1, "\#!env python")
    call setline(2, "\#coding=utf-8")
    call setline(3, "\# ")
    call setline(4, "\# Author:       .com")
    call setline(5, "\# ")
    call setline(6, "\# Created Time: ".strftime("%c"))
    call setline(7, "\# ")
    call setline(8, "\# FileName:     ".expand("%"))
    call setline(9, "\# ")
    call setline(10, "\# Description:  ")
    call setline(11, "\# ")
    call setline(12, "\# ChangeLog:")
elseif &filetype == 'perl'
    call setline(1, "\#!env perl")
    call setline(2, "\#")
    call setline(3, "\# ")
    call setline(4, "\# Author:       .com")
    call setline(5, "\# ")
    call setline(6, "\# Created Time: ".strftime("%c"))
    call setline(7, "\# ")
    call setline(8, "\# FileName:     ".expand("%"))
    call setline(9, "\# ")
    call setline(10, "\# Description:  ")
    call setline(11, "\# ")
    call setline(12, "\# ChangeLog")
elseif &filetype == 'php'
    call setline(1, "<?php")
    call setline(2, "\#")
    call setline(3, "\# ")
    call setline(4, "\# Author:       .com")
    call setline(5, "\# ")
    call setline(6, "\# Created Time: ".strftime("%c"))
    call setline(7, "\# ")
    call setline(8, "\# FileName:     ".expand("%"))
    call setline(9, "\# ")
    call setline(10, "\# Description:  ")
    call setline(11, "?>")
endif
endfunction
filetype on 
autocmd! BufNewFile *.php,*.pl,*.py,*.[ch],*.py,*.sh,*.java exec ":call SetTitle()" 
" NERDTree (better file browser) toggle
map <F3> :NERDTreeToggle<CR>
"tab navigation
map tn :tabn<CR>
map tp :tabp<CR>
map tm :tabm<CR>
map tt :tabnew
map <C-S-Right> :tabn<CR>
imap <C-S-Right> <ESC>:tabn<CR>
map <C-S-Left> :tabp<CR>
imap <C-S-Left> <ESC>:tabp<CR>

" navigate windows with meta+arrows
map <M-Right> <c-w>l
map <M-Left> <c-w>h
map <M-Up> <c-w>k
map <M-Down> <c-w>j
imap <M-Right> <ESC><c-w>l
imap <M-Left> <ESC><c-w>h
imap <M-Up> <ESC><c-w>k
imap <M-Down> <ESC><c-w>j

"设置空格键开关折叠
nmap <SPACE> @=((foldclosed(line('.')) < 0) ? 'zc' : 'zo')<CR>

" NERDTree (better file browser) toggle
map <F3> :NERDTreeToggle<CR>

" always show status bar
set ls=2

" incremental search
set incsearch

" highlighted search results
set hlsearch

" show pending tasks list
map <F2> : TaskList<CR>

" when scrolling, keep cursor 3 lines away from screen border
set scrolloff=3
"toggle Tagbar display
map <F4> :TagbarToggle<CR>
" autofocus on Tagbar open
let g:tagbar_autofocus = 1
" don't let pyflakes allways override the quickfix list
let g:pyflakes_use_quickfix = 0



"pydiction 1.2 python auto complete
filetype plugin on
filetype plugin indent on
"let g:pydiction_location = '~/.vim/tools/pydiction/complete-dict'
""defalut g:pydiction_menu_height == 15
"let g:pydiction_menu_height = 20 

let g:pydoc_cmd = "/usr/local/bin/pydoc"
"ctag 目录查询
au BufEnter /home/liaoxinxi/basescan/ccms/* setlocal tags+=/home/liaoxinxi/basescan/ccms/tags

""""""""""""""""""""""""""""""
" Tag list (ctags)
"""""""""""""""""""""""""""""""
let Tlist_Ctags_Cmd = '/usr/bin/ctags'
let Tlist_Show_One_File = 1
" "不同时显示多个文件的tag，只显示当前文件的
let Tlist_Exit_OnlyWindow = 1
"如果taglist窗口是最后一个窗口，则退出vim
let Tlist_Use_Right_Window = 1         "在右侧窗口中显示taglist窗口 
"when scrolling, keep cursor 3 lines away from screen border
set scrolloff=3

" autocompletition of files and commands behaves like shell
" (complete only the common part, list the options that match)
set wildmode=list:longest

" to use fancy symbols for powerline, uncomment the following line and use a
" patched font (more info on the README.rst)
"let g:Powerline_symbols = 'fancy'

" Uncomment the following to have Vim jump to the last position when
" reopening a file
if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif
"执行保存后的python文件运行E即可
map <buffer> <S-e> :w<CR>:!/usr/bin/env python % <CR>
