setlocal include=require[\ (]["']
setlocal includeexpr=substitute(v:fname,'["'])\=$\|["']).\+$','.coffee','')
setlocal suffixesadd=.coffee
packadd vim-coffee-script
packadd jasmine.vim
packadd javascript-libraries-syntax.vim
packadd jscomplete-vim
packadd vim-javascript
packadd vim-jsdoc

