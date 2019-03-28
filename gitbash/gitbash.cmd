@echo off
title %~nx0

REM ����
set RootDir="%~dp0"
set DestDir="C:\Program Files\Git"
set GitSrc=Git-2.21.0-64-bit.exe
set GitVer=v2.21.0.windows.1
set GitUrl=https://npm.taobao.org/mirrors/git-for-windows/%GitVer%/%GitSrc%

REM �л���ǰĿ¼
cd /d %RootDir%

REM ��� GitBash
if exist %DestDir%\git-bash.exe (
  call :EchoError GitBash �Ѱ�װ!
)

if exist D:\ (
  set DestDir=D:\yzaj\Git
  
  if exist %DestDir%\git-bash.exe (
    call :EchoError GitBash �Ѱ�װ!
  )
)

REM ���� GitBash
if not exist %GitSrc% (
  wget.exe -c %GitUrl%
)

if not exist %GitSrc% (
  call :EchoError GitBash ����ʧ��!
)

REM ��װ GitBash
echo,���ڰ�װ GitBash ...
start /wait "" %GitSrc% /sp- /silent /norestart /dir="%DestDir%"

if not exist %DestDir%\git-bash.exe (
  call :EchoError GitBash ��װʧ��!
)

REM ��ǩ
exit
:EchoError
echo,Error: %*
pause>nul
exit
goto:eof
