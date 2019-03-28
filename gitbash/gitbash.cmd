@echo off
title %~nx0

REM 变量
set RootDir="%~dp0"
set GitBash="C:\Program Files\Git\git-bash.exe"
set GitSrc=Git-2.21.0-64-bit.exe
set GitVer=v2.21.0.windows.1
set GitUrl=https://npm.taobao.org/mirrors/git-for-windows/%GitVer%/%GitSrc%

REM 切换当前目录
cd /d %RootDir%

REM 检查 GitBash
if exist %GitBash% (
  call :EchoMessage GitBash 已安装！
)

REM 下载 GitBash
if not exist %GitSrc% (
  resource\wget.exe -c %GitUrl%
)

if not exist %GitSrc% (
  call :EchoMessage Error - GitBash 下载失败！
)

REM 安装 GitBash
echo,正在安装 GitBash ...
start /wait "" %GitSrc% /sp- /silent /norestart

if not exist %GitBash% (
  call :EchoMessage Error - GitBash 安装失败！
)

REM 复制文件
xcopy resource\"Git Bash.lnk" C:\Users\Public\Desktop /y
xcopy resource\.minttyrc %UserProfile% /y
xcopy resource\.bash_history %UserProfile% /y

if not exist %UserProfile%\.gitconfig (
  xcopy resource\.gitconfig %UserProfile%
)

exit
REM 标签
:EchoMessage
echo,%*
pause>nul
exit
goto:eof
