@echo off
title update

cd ./MaaResource

:: 执行git pull并捕获输出
for /f "delims=" %%i in ('git pull 2^>^&1') do set "output=%%i"
echo %output%
:: 检查输出是否包含"Already up to date"或其他表示不需要更新的信息
echo %output% | findstr /C:"Already up to date" > nul
set /a a=%errorlevel%
:: 检查输出是否包含错误信息
echo %output% | findstr /C:"fatal" > nul
set /a b=%errorlevel%
set /a sum=%a%+%b%
echo %sum%
set /p choice="是否复制（y or n）: "

if "%choice%"=="y" (
    goto copycmd
    REM 在这里执行命令1
) else if "%choice%"=="n" (
    goto end
    REM 在这里执行命令2
) else (
    echo 无效的选择
)

:end
REM echo %elapsed%
pause&exit;

:copycmd
:: 如果git pull成功，复制文件夹a到文件夹b
echo 成功，开始复制
xcopy cache ..\cache /E /I /Y
xcopy resource ..\resource  /E /I /Y