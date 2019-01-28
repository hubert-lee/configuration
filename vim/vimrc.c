set cindent    "C 프로그래밍용 자동 들여쓰기
set expandtab
set tabstop=4
set shiftwidth=4

" 100컬럼이 넘어가는 문장의 경우 빨간색 배경으로 하이라이팅
" https://stackoverflow.com/questions/235439/vim-80-column-layout-concerns
highlight OverLength ctermbg=red ctermfg=white guibg=#592929
match OverLength /\%101v.\+/

" 저장할 때, trailing white space 삭제
" http://vim.wikia.com/wiki/Remove_unwanted_spaces
autocmd BufWritePre * %s/\s\+$//e
