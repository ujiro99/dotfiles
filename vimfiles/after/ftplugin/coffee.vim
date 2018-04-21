setlocal include=require[\ (]["']
setlocal includeexpr=substitute(v:fname,'["'])\=$\|["']).\+$','.coffee','')
setlocal suffixesadd=.coffee

if !exists("coffee_plugin_loaded")
  let coffee_plugin_loaded = 1
  packadd jasmine.vim
  packadd javascript-libraries-syntax.vim
  packadd jscomplete-vim
  packadd vim-jsdoc
endif
