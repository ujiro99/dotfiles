cd %USERPROFILE%
git clone https://github.com/ujiro99/dotfiles.git
git clone https://github.com/github/gitignore.git
mkdir %USERPROFILE%/dotfiles/vimfiles/bundle
git clone https://github.com/Shougo/neobundle.vim %USERPROFILE%\dotfiles\vimfiles\bundle\neobundle.vim
git clone https://github.com/Shougo/vimproc %USERPROFILE%/dotfiles/vimfiles/bundle/vimproc
mklink %USERPROFILE%\_vimrc %USERPROFILE%\dotfiles\_vimrc
mklink %USERPROFILE%\_gvimrc %USERPROFILE%\dotfiles\_gvimrc
mklink %USERPROFILE%\_nya %USERPROFILE%\dotfiles\_nyarc
mklink %USERPROFILE%\.vsvimrc %USERPROFILE%\dotfiles\.vsvimrc
mklink %USERPROFILE%\.gitignore %USERPROFILE%\dotfiles\.gitignore
mklink %USERPROFILE%\.gitconfig %USERPROFILE%\dotfiles\.gitconfig
mklink %USERPROFILE%\.vrapperrc %USERPROFILE%\dotfiles\.vrapperrc
mklink %USERPROFILE%\.zshrc %USERPROFILE%\dotfiles\.zshrc
mklink %USERPROFILE%\.gtagsrc %USERPROFILE%\dotfiles\.gtagsrc
mklink /d %USERPROFILE%\vimfiles %USERPROFILE%\dotfiles\vimfiles
reg add "HKEY_CURRENT_USER\Software\Microsoft\Command Processor" /v AutoRun /d "doskey /macrofile=%USERPROFILE%\dotfiles\.cmdrc"