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
-- vim.o.columns = 120 -- "横幅
-- vim.o.lines = 60 -- "高さ

-- カラースキーム
vim.cmd.colorscheme("everforest")
vim.o.background = "dark"

-- Fern
vim.g["fern#renderer"] = "nvim-web-devicons"

-- フォント
vim.o.guifont = "UDEV Gothic NF:h11"
