-------------------------------------------------------------------------------
-- 表示 Apperance
-------------------------------------------------------------------------------
vim.o.showmatch = true -- 括弧の対応をハイライト
vim.o.number = true -- 行番号表示
vim.o.cursorline = true -- カーソル行をハイライト
vim.o.number = true -- 行番号の表示
vim.o.list = true -- 不可視文字表示
vim.o.listchars = "tab:»-,trail:_,extends:»,precedes:«,nbsp:%" -- 不可視文字の表示形式
vim.o.signcolumn = "yes"

-- vim.o.guifont = "Firge"

-- カラースキーム
vim.cmd [[colorscheme spring-night]]
vim.o.background = "dark"
vim.g.lightline = { colorscheme = 'spring_night' }
