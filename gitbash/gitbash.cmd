@echo off
title %~nx0

set InstallDp="%~dp0"

REM ����
set RootDir="%InstallDp:~1,-2%"
set InstallDir=C:\
if exist yzaj.cmd (
  call yzaj.cmd
)

set SrcDir=%RootDir%\resource
set DestDir=%InstallDir%\yzaj\yzaj
set CygSrc=%SrcDir%\Cygwin-x86_64.exe
set CygDest=%DestDir%\cygwin64
set CygUrl=https://mirrors.aliyun.com/cygwin/
set CygLnk="C:\Users\Public\Desktop\Cygwin64 Terminal.lnk"
set CygCmd=C:\Users\Public\Cygwin.cmd
set CygTty=%CygDest%\bin\mintty.exe
set "Cygwin=%CygTty% -i /Cygwin-Terminal.ico -e /bin/bash --login -i -c"

set HH=%Time:~0,2%
if "%HH%" lss "10" (
  set HH=0%Time:~1,1%
)
set BakTime=bak.%Date:~0,4%-%Date:~5,2%-%Date:~8,2%-%HH%%Time:~3,2%%Time:~6,2%

REM ��װ Cygwin
if exist %CygCmd% (
  del %CygCmd%
)

if exist %CygLnk% (
  del %CygLnk%
)

if exist %DestDir% (
  tasklist|findstr /i "^adb\.exe"&&taskkill /im adb.exe /f
  move %DestDir% %DestDir%.%BakTime%
)

mkdir %DestDir%

start /wait "" %CygSrc% -q -W -R %CygDest% -s %CygUrl% -P wget

if not exist %CygTty% (
  call :EchoError Cygwin ��װʧ��!
)

REM �����ļ�
xcopy %SrcDir%\apt-cyg %CygDest%\bin
xcopy %SrcDir%\install.sh %CygDest%
xcopy %SrcDir%\adb %CygDest%\bin /e

REM �����ļ�
echo,/cygdrive/%InstallDir%/yzaj>%CygDest%\install.tmp
(
echo,@echo off
echo,title %%~nx0
echo,start "" %Cygwin% %%1
)>%CygCmd%

REM Cygwin ���нű�
start "" %Cygwin% /install.sh

REM ��ǩ
exit
:EchoError
echo,Error: %*
pause>nul
exit
goto:eof
