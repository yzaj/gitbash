@echo off
title %~nx0

REM 变量
set RootDir="%~dp0"
set DestDir="C:\Program Files\Git"
set GitSrc=Git-2.21.0-64-bit.exe
set GitVer=v2.21.0.windows.1
set GitUrl=https://npm.taobao.org/mirrors/git-for-windows/%GitVer%/%GitSrc%

REM 切换当前目录
cd /d %RootDir%

REM 检查 GitBash
if exist %DestDir%\git-bash.exe (
  call :EchoError GitBash 已安装!
)


























REM 标签
exit
:EchoError
echo,Error: %*
pause>nul
exit
goto:eof
