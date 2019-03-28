@echo off
title %~nx0

REM ����
set RootDir="%~dp0"
set GitBash="C:\Program Files\Git\git-bash.exe"
set GitSrc=Git-2.21.0-64-bit.exe
set GitVer=v2.21.0.windows.1
set GitUrl=https://npm.taobao.org/mirrors/git-for-windows/%GitVer%/%GitSrc%

REM �л���ǰĿ¼
cd /d %RootDir%

REM ��� GitBash
if exist %GitBash% (
  call :EchoMessage GitBash �Ѱ�װ��
)

REM ���� GitBash
if not exist %GitSrc% (
  resource\wget.exe -c %GitUrl%
)

if not exist %GitSrc% (
  call :EchoMessage Error - GitBash ����ʧ�ܣ�
)

REM ��װ GitBash
echo,���ڰ�װ GitBash ...
start /wait "" %GitSrc% /sp- /silent /norestart

if not exist %GitBash% (
  call :EchoMessage Error - GitBash ��װʧ�ܣ�
)

REM �����ļ�
xcopy resource\"Git Bash.lnk" C:\Users\Public\Desktop /y
xcopy resource\.minttyrc %UserProfile% /y
xcopy resource\.bash_history %UserProfile% /y

if not exist %UserProfile%\.gitconfig (
  xcopy resource\.gitconfig %UserProfile%
)

exit
REM ��ǩ
:EchoMessage
echo,%*
pause>nul
exit
goto:eof
