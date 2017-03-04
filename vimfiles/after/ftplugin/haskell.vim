packadd ghcmod-vim
packadd vim2hs
packadd neco-ghc

" http://qiita.com/joker1007/items/59ac3fa162df7c9cc952
augroup ghcmodcheck
  autocmd! BufWritePost <buffer> GhcModCheckAsync
augroup END

