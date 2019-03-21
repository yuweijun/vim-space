" vim-space.vim
" Author:       <test.yu@gmail.com>
" Version:      0.1
" Date:         2019-03-20 19:04:58

if exists("g:vim_space")
    finish
endif

let g:vim_space = 1
scriptencoding utf-8

" ------------------------------------------------------------------------------
" 在中文字符和英文字符相接位置插入一个空格
" ------------------------------------------------------------------------------

function! SpaceAddBetweenEnglishChinese()
    for linenum in range(1, line('$'))
        let oldline = getline(linenum)
        let newline = substitute(oldline, '\([\u4e00-\u9fa5]\)\(\w\)', '\1 \2', 'g')
        let newline = substitute(newline, '\(\w\)\([\u4e00-\u9fa5]\)', '\1 \2', 'g')
        call setline(linenum, newline)
    endfor
endfunction

" ------------------------------------------------------------------------------
" 删除中文字符和英文字符相接位置的空格
" ------------------------------------------------------------------------------

function! SpaceRemoveBetweenEnglishChinese()
    for linenum in range(1, line('$'))
        let oldline = getline(linenum)
        let newline = substitute(oldline, '\([\u4e00-\u9fa5]\)\s\(\w\)', '\1\2', 'g')
        let newline = substitute(newline, '\(\w\)\s\([\u4e00-\u9fa5]\)', '\1\2', 'g')
        call setline(linenum, newline)
    endfor
endfunction

" ------------------------------------------------------------------------------
" // 开始的注释行，在斜杠后面加入一个空格
" ------------------------------------------------------------------------------

function! SpaceAddAtSlashCommentStart()
    for linenum in range(1, line('$'))
        let oldline = getline(linenum)
        let newline = substitute(oldline, '^\(\s*\/\/\)\s*', '\1', "")
        let newline = substitute(newline, '^\(\s*\/\/\)', '\1 ', "")
        call setline(linenum, newline)
    endfor
endfunction

" ------------------------------------------------------------------------------
" replace \u+00A0 with \u+0020
" using nornal space replace non-blocking space
" :%s/ctrl+k, space, space/space/g
" ------------------------------------------------------------------------------

function! ReplaceNonBlockingSpace()
    for linenum in range(1, line('$'))
        let oldline = getline(linenum)
        let newline = substitute(oldline, ' ', ' ', "g")
        call setline(linenum, newline)
    endfor
endfunction

