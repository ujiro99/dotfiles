cd %USERPROFILE%
mkdir %USERPROFILE%\dotfiles\vimfiles\bundle
mkdir %USERPROFILE%\AppData\Local\nvim

mklink %USERPROFILE%\AppData\Local\nvim\init.lua %USERPROFILE%\dotfiles\_vimrc
mklink /d %USERPROFILE%\AppData\Local\nvim\lua %USERPROFILE%\dotfiles\nvim\lua
mklink /d %USERPROFILE%\AppData\Local\nvim\plugin %USERPROFILE%\dotfiles\nvim\plugin
mklink /d %USERPROFILE%\AppData\Local\nvim\snippets %USERPROFILE%\dotfiles\nvim\snippets
mklink %USERPROFILE%\.gitconfig %USERPROFILE%\dotfiles\.gitconfig
mklink %USERPROFILE%\.gtagsrc %USERPROFILE%\dotfiles\.gtagsrc

mklink /d %USERPROFILE%\.vim %USERPROFILE%\dotfiles\vimfiles
mklink /d %USERPROFILE%\vimfiles %USERPROFILE%\dotfiles\vimfiles
mkdir %USERPROFILE%/.vim/backup
mkdir %USERPROFILE%/.vim/swap
mkdir %USERPROFILE%/.vim/undo

powershell -Command "Set-ExecutionPolicy RemoteSigned -Scope CurrentUser"
powershell -Command "irm get.scoop.sh | iex"

scoop install lua-language-server
scoop install neovim
scoop install fd
scoop install fzf
scoop install ripgrep
scoop install zig
scoop install nvm
scoop install stylua
scoop install go

go install github.com/x-motemen/ghq@latest

pause
