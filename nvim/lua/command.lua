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
vim.api.nvim_create_user_command("CopyFullPath", function()
	vim.api.nvim_command("let @*=expand('%:p')")
end, { nargs = 0 })

-- 表示中のファイル名をクリップボードへコピー
vim.api.nvim_create_user_command("CopyName", function()
	vim.fn.setreg("+", vim.fn.expand("%:t"))
end, { nargs = 0 })

-- プロジェクトルート(.git のあるディレクトリ)からの相対パスをコピー
vim.api.nvim_create_user_command("CopyPath", function()
	-- カレントバッファのフルパス
	local full_path = vim.fn.expand("%:p")

	-- .git を上方向に探索してルートを取得
	local git_dir = vim.fs.find(".git", {
		upward = true,
		path = vim.fs.dirname(full_path),
	})[1]

	if not git_dir then
		vim.notify("Git リポジトリ内ではありません", vim.log.levels.WARN)
		return
	end

	-- .git の親ディレクトリをプロジェクトルートとする
	local project_root = vim.fs.dirname(git_dir)

	-- ルートからの相対パスを計算
	local relative_path = vim.fn.fnamemodify(full_path, ":~:.")
	relative_path = full_path:gsub("^" .. vim.pesc(project_root .. "/"), "")

	-- クリップボードにコピー（* レジスタ）
	vim.fn.setreg("*", relative_path)
	vim.notify('Copied "' .. relative_path .. '" to clipboard')
end, { nargs = 0 })
