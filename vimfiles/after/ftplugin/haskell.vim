if !exists("haskell_plugin_loaded")
  let haskell_plugin_loaded = 1
  packadd ghcmod-vim
  packadd vim2hs
  packadd neco-ghc
endif

" http://qiita.com/joker1007/items/59ac3fa162df7c9cc952
augroup ghcmodcheck
  autocmd! BufWritePost <buffer> GhcModCheckAsync
augroup END

