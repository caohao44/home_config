autocmd BufReadPost *
    \ if line("'\"")>0&&line("'\"")<=line("$") |
    \   exe "normal g'\"" |
    \ endif

set nocompatible              " be iMproved, required
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'gmarik/Vundle.vim'
Plugin 'Valloric/YouCompleteMe'
Plugin 'scrooloose/nerdcommenter'
call vundle#end()


"set completeopt=longest,menu
set rtp+=~/.vim/bundle/YouCompleteMe
let g:ycm_global_ycm_extra_conf = '~/.vim/bundle/YouCompleteMe/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py'   "配置默认的ycm_extra_conf.py
nnoremap <F12> :YcmCompleter GoToDeclaration<CR>
nmap <F5> :YcmDiags<CR>
nmap <F6> :YcmCompleter GetDoc<CR>
nmap <C-F5> :lclose<CR>

let NERDSpaceDelims = 1
map <F2> <Leader>ci
map <F3> <Leader>cu

if exists('$TMUX')
    let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
    let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"
else
    let &t_SI = "\<Esc>]50;CursorShape=1\x7"
    let &t_EI = "\<Esc>]50;CursorShape=0\x7"
endif


if v:lang =~ "utf8$" || v:lang =~ "UTF-8$"
   set fileencodings=ucs-bom,utf-8,latin1
endif


syntax enable

filetype on
filetype plugin on
filetype plugin indent on

set nocompatible	" Use Vim defaults (much better!)
set bs=indent,eol,start		" allow backspacing over everything in insert mode
set history=1000		" keep 50 lines of command line history
set ruler		" show the cursor position all the time
set tabstop=4        "设置制表符的宽度 

set softtabstop=4     " 设置软制表符的宽度    
set shiftwidth=4    " 自动缩进使用的4个空格
set cindent            " 使用 C/C++ 语言的自动缩进方式
set backspace=2    " 设置退格键可用
set showmatch        "  设置匹配模式，显示匹配的括号
set linebreak        " 整词换行
"set whichwrap=b,s,<,>,[,] "           光标从行首和行末时可以跳到另一行去
set hidden " Hide buffers when they are abandoned
set mouse=nvc
set mousemodel=extend
set ttymouse=xterm2
set number            "   Enable line number              "显示行号
set previewwindow   " 标识预览窗口
set expandtab
set foldenable      " 允许折叠  
set foldmethod=manual   " 手动折叠 
set t_Co=256
set listchars=tab:>-,nbsp:_ " show the <TAB> char
let g:rehash256 = 1
let g:molokai_original = 1
colorscheme molokai



"新建.c,.h,.sh,.java文件，自动插入文件头 
autocmd BufNewFile *.cpp,*.[ch],*.sh,*.py exec ":call SetTitle()" 
"定义函数SetTitle，自动插入文件头 
func SetTitle() 
    "如果文件类型为.sh文件 
    if &filetype == 'sh' 
        call setline(1,"\#!/bin/bash") 
        call append(line("."),"") 
    elseif &filetype == 'cpp' || &filetype == 'c' || &filetype =='h' 
        call setline(1, "\/*************************************************************************/") 
        call append(line("."), "\// File Name: ".expand("%")) 
        call append(line(".")+1, "\// Author: Cao Hao") 
        call append(line(".")+2, "\// Email: caohao@unisound.com ") 
        call append(line(".")+3, "\// Created Time: ".strftime("%c"))
        call append(line(".")+4, "\// Usage: ")
        call append(line(".")+5, "\/************************************************************************/") 
        call append(line(".")+6, "")
    else
        call setline(1,"\#!/usr/bin/python") 
        call append(line("."),"\# -*- coding: utf-8 -*-")
        call append(line(".")+1,"") 
    endif
     "新建文件后，自动定位到文件末尾
    autocmd BufNewFile * normal G

endfunc 



map <C-A> ggVG

