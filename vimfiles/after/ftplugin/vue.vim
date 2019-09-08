" * での検索や text-object 等での選択時に - で切らない
setlocal iskeyword& iskeyword+=-

if !exists("vue_plugin_loaded")
  let vue_plugin_loaded = 1

  packadd emmet-vim
  packadd javascript-libraries-syntax.vim
  packadd vim-css3-syntax
  packadd vim-javascript
  packadd vim-jsdoc
  packadd vim-node
  packadd vim-vue

endif

