" plugin/ 目录存放插件的核心功能
" 本文件 commenter.vim 存放基本核心功能

" 注释python 代码的当前行
"let s:comment_string = ''
function! g:commenter#Comment()
  let l:i = indent('.') " 缩进的空格
  "在当前行 . 的行首插入一个 #
  let l:line = getline('.')
  "call setline('.' , '# ' . l:line[1:i:])
  call setline('.', l:line[:l:i - 1] . '# ' . l:line[l:i:])
endfunction

nnoremap gc :call g:commenter#Comment()<cr>
