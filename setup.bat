cd %USERPROFILE%
mkdir %USERPROFILE%/dotfiles/vimfiles/bundle
git clone https://github.com/github/gitignore.git
mklink %USERPROFILE%\_vimrc %USERPROFILE%\dotfiles\_vimrc
mklink %USERPROFILE%\_gvimrc %USERPROFILE%\dotfiles\_gvimrc
mklink %USERPROFILE%\_nya %USERPROFILE%\dotfiles\_nyarc
mklink %USERPROFILE%\.vsvimrc %USERPROFILE%\dotfiles\.vsvimrc
mklink %USERPROFILE%\.gitignore %USERPROFILE%\dotfiles\.gitignore
mklink %USERPROFILE%\.gitconfig %USERPROFILE%\dotfiles\.gitconfig
mklink %USERPROFILE%\.vrapperrc %USERPROFILE%\dotfiles\.vrapperrc
mklink %USERPROFILE%\.gtagsrc %USERPROFILE%\dotfiles\.gtagsrc

mklink /d %USERPROFILE%\.vim %USERPROFILE%\dotfiles\vimfiles
mklink /d %USERPROFILE%\vimfiles %USERPROFILE%\dotfiles\vimfiles
mkdir %USERPROFILE%/.vim/backup
mkdir %USERPROFILE%/.vim/swap
mkdir %USERPROFILE%/.vim/undo
git submodule init
git submodule update

reg add "HKEY_CURRENT_USER\Software\Microsoft\Command Processor" /v AutoRun /d "doskey /macrofile=%USERPROFILE%\dotfiles\.cmdrc"

pause
