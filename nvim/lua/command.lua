---------------------------------------------
-- command
---------------------------------------------
-- vimrcのリロード
vim.cmd("command! ReloadVimrc :luafile %")

-- 表示中バッファのディレクトリへ移動
vim.cmd("command! -nargs=0 CdCurrent cd %:p:h")

-- 空白の除去
vim.api.nvim_create_user_command("RemoveSpace", function()
	vim.api.nvim_command(":%s/\\s\\+$//ge") -- 行末の空白を除去する
	vim.api.nvim_command(":%s/\\t/  /ge") -- tabをスペースに変換する
end, { nargs = 0 })

-- 表示中のファイルパスをクリップボードへコピー
vim.api.nvim_create_user_command("CopyPath", function()
	vim.api.nvim_command("let @*=expand('%:p')")
end, { nargs = 0 })

-- 表示中のファイル名をクリップボードへコピー
vim.api.nvim_create_user_command("CopyName", function()
	vim.fn.setreg("+", vim.fn.expand("%:t"))
end, { nargs = 0 })
