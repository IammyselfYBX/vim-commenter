" plugin/ 目录存放插件的核心功能
" 本文件 commenter.vim 存放基本核心功能

" 注释python 代码的当前行
let s:comment_string = '# '
" 改函数变成一个开关
function! g:ToggleComment()
  "在当前行 . 的行首插入一个 #
  let l:i = indent('.') " 缩进的空格
  let l:line = getline('.') " 获得改行的内容
"  call setline('.', l:line[:l:i - 1] . s:comment_string . l:line[l:i:])
  " 希望光标回到当前位置
  let l:cur_row = getcurpos()[1]
  let l:cur_col = getcurpos()[2]
"  call cursor(l:cur_row, l:cur_col + len(s:comment_string))
  if l:line[l:i:l:i + len(s:comment_string) - 1] == s:comment_string
    call setline('.', l:line[:l:i - 1] . l:line[l:i + len(s:comment_string):])
    let l:cur_offset = -len(s:comment_string)
  else
    call setline('.', l:line[:l:i - 1] . s:comment_string . l:line[l:i:])
    let l:cur_offset = len(s:comment_string)
  endif
  call cursor(l:cur_row, l:cur_col + l:cur_offset)
endfunction

nnoremap gc :call g:ToggleComment()<cr>
