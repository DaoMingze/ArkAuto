@echo off
title update

cd ./MaaResource

:: ִ��git pull���������
for /f "delims=" %%i in ('git pull 2^>^&1') do set "output=%%i"
echo %output%
:: �������Ƿ����"Already up to date"��������ʾ����Ҫ���µ���Ϣ
echo %output% | findstr /C:"Already up to date" > nul
set /a a=%errorlevel%
:: �������Ƿ����������Ϣ
echo %output% | findstr /C:"fatal" > nul
set /a b=%errorlevel%
set /a sum=%a%+%b%
echo %sum%
set /p choice="�Ƿ��ƣ�y or n��: "

if "%choice%"=="y" (
    goto copycmd
    REM ������ִ������1
) else if "%choice%"=="n" (
    goto end
    REM ������ִ������2
) else (
    echo ��Ч��ѡ��
)

:end
REM echo %elapsed%
pause&exit;

:copycmd
:: ���git pull�ɹ��������ļ���a���ļ���b
echo �ɹ�����ʼ����
xcopy cache ..\cache /E /I /Y
xcopy resource ..\resource  /E /I /Y