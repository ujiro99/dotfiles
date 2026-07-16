-- これで慣れてる
vim.g.mapleader = " "

if vim.g.vscode then
	require("base")
	require("moving")
	require("search")
else
	require("plugins")
	require("base")
	require("indent")
	require("command")
	require("appearance")
	require("moving")
	require("search")
end
