@echo off
title %~nx0

REM ±äÁ¿
set RootDir="%~dp0"
set InstallDir="C:\Program Files"
set GitSrc=Git-2.21.0-64-bit.exe
set GitDest=%InstallDir%\Git
set GitUrl1=https://npm.taobao.org/mirrors/git-for-windows
set GitUrl2=v2.21.0.windows.1

REM 
cd /d %RootDir%




















REM ±êÇ©
exit
:EchoError
echo,Error: %*
pause>nul
exit
goto:eof
