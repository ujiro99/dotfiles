cd %USERPROFILE%
mkdir %USERPROFILE%/dotfiles/vimfiles/bundle

mklink %USERPROFILE%\_vimrc %USERPROFILE%\dotfiles\_vimrc
mklink %USERPROFILE%\_gvimrc %USERPROFILE%\dotfiles\_gvimrc
mklink %USERPROFILE%\.nyagos %USERPROFILE%\dotfiles\.nyagos
mklink %USERPROFILE%\.vsvimrc %USERPROFILE%\dotfiles\.vsvimrc
mklink %USERPROFILE%\.gitignore %USERPROFILE%\dotfiles\.gitignore
mklink %USERPROFILE%\.gitconfig %USERPROFILE%\dotfiles\.gitconfig
mklink %USERPROFILE%\.vrapperrc %USERPROFILE%\dotfiles\.vrapperrc
mklink %USERPROFILE%\.gtagsrc %USERPROFILE%\dotfiles\.gtagsrc
mklink %USERPROFILE%\.bashrc %USERPROFILE%\dotfiles\.bashrc

mklink /d %USERPROFILE%\.vim %USERPROFILE%\dotfiles\vimfiles
mklink /d %USERPROFILE%\vimfiles %USERPROFILE%\dotfiles\vimfiles
mkdir %USERPROFILE%/.vim/backup
mkdir %USERPROFILE%/.vim/swap
mkdir %USERPROFILE%/.vim/undo

git clone https://github.com/github/gitignore.git
git clone https://github.com/k-takata/minpac.git ~/.vim/pack/minpac/opt/minpac
go get github.com/motemen/ghq
go get github.com/junegunn/fzf

vim -c PackUpdate -c q

reg add "HKEY_CURRENT_USER\Software\Microsoft\Command Processor" /v AutoRun /d "doskey /macrofile=%USERPROFILE%\dotfiles\.cmdrc"

pause
