@echo off
title MAA link
echo First, you should input adb's path
set /p adbpath=
echo and you can see which devices is linked
%adbpath%\adb devices -l
set /p device=which_devices?:
echo Now let's set the resolution size temporarily.
%adbpath%\adb -s %device% shell wm size 720x1280
echo Then,we open the arknights

:CHOICE
ECHO.
ECHO 1 - open arknights by hypergryph
ECHO 2 - open arknights by bilibili
ECHO.
CHOICE /C:12 /N
IF errorlevel 2 goto TWO
IF errorlevel 1 goto ONE
:ONE
echo "officer"
%adbpath%\adb -s %device% shell am start com.hypergryph.arknights/com.u8.sdk.U8UnityContext
goto end
exit

:TWO
echo "bilibili"
%adbpath%\adb -s %device% shell am start com.hypergryph.arknights.bilibili/com.u8.sdk.SplashActivity
goto end
EXIT

:end
echo please input maa's path
set /p maapath=
%maapath%.maa.exe
echo don't close me, i will close after you close maa.
%adbpath%\adb -s %device% shell wm size reset