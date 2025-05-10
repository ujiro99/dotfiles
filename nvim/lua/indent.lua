-------------------------------------------------------------------------------
-- インデント Indent
-------------------------------------------------------------------------------
vim.o.autoindent = true -- 自動でインデント
vim.o.smartindent = true -- 新しい行を開始したときに、新しい行のインデントを現在行と同じ量にする。

-- softtabstopはTabキー押し下げ時の挿入される空白の量，0の場合はtabstopと同じ，BSにも影響する
vim.o.tabstop = 2
vim.o.shiftwidth = 2
vim.o.softtabstop = 0

vim.cmd([[
  autocmd FileType go         setlocal sw=4 sts=4 ts=4 noet
  autocmd FileType cs         setlocal sw=4 sts=4 ts=4 et
  autocmd FileType css        setlocal sw=2 sts=2 ts=2 et
  autocmd FileType stylus     setlocal sw=2 sts=2 ts=2 et
  autocmd FileType diff       setlocal sw=4 sts=4 ts=4 et
  autocmd FileType eruby      setlocal sw=4 sts=4 ts=4 et
  autocmd FileType html       setlocal sw=2 sts=2 ts=2 et
  autocmd FileType jade       setlocal sw=2 sts=2 ts=2 et
  autocmd FileType java       setlocal sw=4 sts=4 ts=4 et
  autocmd FileType javascript setlocal sw=2 sts=2 ts=2 et
  autocmd FileType typescript setlocal sw=2 sts=2 ts=2 et
  autocmd FileType typescriptreact setlocal sw=2 sts=2 ts=2 et
  autocmd FileType vue        setlocal sw=2 sts=2 ts=2 et
  autocmd FileType coffee     setlocal sw=2 sts=2 ts=2 et
  autocmd FileType python     setlocal sw=4 sts=4 ts=4 et
  autocmd FileType ruby       setlocal sw=2 sts=2 ts=2 et
  autocmd FileType haml       setlocal sw=2 sts=2 ts=2 et
  autocmd FileType sh         setlocal sw=4 sts=4 ts=4 et
  autocmd FileType vim        setlocal sw=2 sts=2 ts=2 et
  autocmd FileType wsh        setlocal sw=4 sts=4 ts=4 et
  autocmd FileType xhtml      setlocal sw=4 sts=4 ts=4 et
  autocmd FileType xml        setlocal sw=4 sts=4 ts=4 et
  autocmd FileType yaml       setlocal sw=2 sts=2 ts=2 et
  autocmd FileType zsh        setlocal sw=4 sts=4 ts=4 et
  autocmd FileType scala      setlocal sw=2 sts=2 ts=2 et
  autocmd FileType php        setlocal sw=4 sts=4 ts=4 et
  autocmd FileType scss       setlocal sw=2 sts=2 ts=2 et
]])
