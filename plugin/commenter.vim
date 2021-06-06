" plugin/ 目录存放插件的核心功能
" 本文件 commenter.vim 存放基本核心功能

" 注释python 代码的当前行
function! g:commenter#Comment()
  "在当前行 . 的行首插入一个 #
  let l:line = getline('.')
  call setline('.' , '# ' . l:line[1:i:])
endfunction

nnoremap gc :call g:commenter#Comment()<cr>
