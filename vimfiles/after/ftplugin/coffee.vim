setlocal include=require[\ (]["']
setlocal includeexpr=substitute(v:fname,'["'])\=$\|["']).\+$','.coffee','')
setlocal suffixesadd=.coffee
