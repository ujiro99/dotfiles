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
mklink %USERPROFILE%\.zshrc %USERPROFILE%\dotfiles\.zshrc
mklink %USERPROFILE%\.gtagsrc %USERPROFILE%\dotfiles\.gtagsrc
mkdir %USERPROFILE%\documents\WindowsPowerShell
mklink %USERPROFILE%\Documents\WindowsPowerShell\profile.ps1 %USERPROFILE%\dotfiles\powershell\profile.ps1
mklink %USERPROFILE%\Documents\WindowsPowerShell\gitutils.ps1 %USERPROFILE%\dotfiles\powershell\gitutils.ps1
mklink /d %USERPROFILE%\.vim %USERPROFILE%\dotfiles\vimfiles
reg add "HKEY_CURRENT_USER\Software\Microsoft\Command Processor" /v AutoRun /d "doskey /macrofile=%USERPROFILE%\dotfiles\.cmdrc"
pause
