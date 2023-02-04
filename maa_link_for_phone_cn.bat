@echo off
title MAA连接
echo 首先，输入adb所在的路径
set /p adbpath=
echo 现在你可见到以下连接到adb的设备
%adbpath%\adb devices -l
set /p device=输入设备名称:
echo 现在，将按MAA文档，将分辨率暂时改为720x1280
%adbpath%\adb -s %device% shell wm size 720x1280
echo 然后，我们将启动明日方舟

:CHOICE
ECHO.
ECHO 1 - 打开明日方舟官服
ECHO 2 - 打开明日方舟B 服
ECHO.
CHOICE /C:12 /N
IF errorlevel 2 goto TWO
IF errorlevel 1 goto ONE
:ONE
echo 官服
%adbpath%\adb -s %device% shell am start com.hypergryph.arknights/com.u8.sdk.U8UnityContext
goto end
exit

:TWO
echo B 服
%adbpath%\adb -s %device% shell am start com.hypergryph.arknights.bilibili/com.u8.sdk.SplashActivity
goto end
EXIT

:end
echo 请输入MAA的路径
set /p maapath=
%maapath%.maa.exe
echo 请别关闭该窗口，在关闭MAA后，将调回分辨率并自动关闭
%adbpath%\adb -s %device% shell wm size reset