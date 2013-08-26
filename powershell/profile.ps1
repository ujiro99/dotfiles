# プロンプト
# See http://gist.github.com/180853 for gitutils.ps1.
. (Resolve-Path ~/Documents/WindowsPowershell/gitutils.ps1)

function prompt {

  # ディレクトリの表示
  $pwd = $(get-location)
  write-host ("[" + $pwd + "]") -nonewline -foregroundcolor Cyan
  write-host " " -nonewline

  # Gitリポジトリがあった場合
  #if (isCurrentDirectoryGitRepository) {
  #
  #    $branch = $(gitBranchName)
  #    # ブランチ名の表示を右寄せする
  #    $oldposition = $host.ui.rawui.CursorPosition
  #    $Endline = $oldposition
  #    # 一行の行数からブラケットとブランチ名の長さを引く
  #    $Endline.X = 80 - 2 - $branch.Length
  #    $host.ui.rawui.CursorPosition = $Endline
  #
  #    if ($(gitStatus) -eq 1) {
  #      write-host ("[" + $branch + "]") -nonewline -foregroundcolor Red
  #    } else {
  #      write-host ("[" + $branch + "]") -nonewline -foregroundcolor Blue
  #    }
  #
  #    $host.ui.rawui.CursorPosition = $oldposition
  #}

  write-host ""
  return "$ "
}

function subl { &"${Env:ProgramFiles}\Sublime Text 3\sublime_text.exe" $args }

# function for alias
function SetLocationToDesktop { set-location ~/Desktop }
function SetLocationUp1 { set-location ../ }
function SetLocationUp2 { set-location ../../ }
function SetLocationHome { set-location $HOME }
function ForceKill { taskkill /f /im }

# alias
sal l   ls
sal g   git
sal s   svn
sal c   cd
sal cdd SetLocationToDesktop
sal ch  SetLocationHome
sal a   adb
sal u   SetLocationUp1
sal uu  SetLocationUp2
sal st  start
sal fk  ForceKill
sal vg  vagrant
