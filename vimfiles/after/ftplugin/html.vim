" * での検索や text-object 等での選択時に - で切らない
setlocal iskeyword& iskeyword+=-

if !exists("html_plugin_loaded")
  let html_plugin_loaded = 1
  packadd emmet-vim
endif
