" * での検索や text-object 等での選択時に - で切らない
setlocal iskeyword& iskeyword+=-

if !exists("css_plugin_loaded")
  let css_plugin_loaded = 1
  packadd emmet-vim
  packadd vim-css3-syntax
endif

