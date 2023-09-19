cd %USERPROFILE%
mkdir %USERPROFILE%/dotfiles/vimfiles/bundle

mklink %USERPROFILE%\AppData\Local\nvim\init.vim %USERPROFILE%\dotfiles\_vimrc
mklink /d %USERPROFILE%\AppData\Local\nvim\lua %USERPROFILE%\dotfiles\nvim\lua
mklink /d %USERPROFILE%\AppData\Local\nvim\plugin %USERPROFILE%\dotfiles\nvim\plugin
mklink /d %USERPROFILE%\AppData\Local\nvim\snippets %USERPROFILE%\dotfiles\nvim\snippets
mklink %USERPROFILE%\_gvimrc %USERPROFILE%\dotfiles\_gvimrc
mklink %USERPROFILE%\.gitconfig %USERPROFILE%\dotfiles\.gitconfig
mklink %USERPROFILE%\.gtagsrc %USERPROFILE%\dotfiles\.gtagsrc
mklink %USERPROFILE%\.bashrc %USERPROFILE%\dotfiles\.bashrc

mklink /d %USERPROFILE%\.vim %USERPROFILE%\dotfiles\vimfiles
mklink /d %USERPROFILE%\vimfiles %USERPROFILE%\dotfiles\vimfiles
mkdir %USERPROFILE%/.vim/backup
mkdir %USERPROFILE%/.vim/swap
mkdir %USERPROFILE%/.vim/undo

git clone https://github.com/github/gitignore.git
go install github.com/x-motemen/ghq@latest
go install github.com/junegunn/fzf

powershell -Command "Set-ExecutionPolicy RemoteSigned -Scope CurrentUser"
powershell -Command "irm get.scoop.sh | iex"

scoop install lua-language-server
scoop install fd
scoop install fzf
scoop install ripgrep
scoop install zig

pause
