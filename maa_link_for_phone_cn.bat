@echo off
title MAA����
echo ���ȣ�����adb���ڵ�·��
set /p adbpath=
echo ������ɼ����������ӵ�adb���豸
%adbpath%\adb devices -l
set /p device=�����豸����:
echo ���ڣ�����MAA�ĵ������ֱ�����ʱ��Ϊ720x1280
%adbpath%\adb -s %device% shell wm size 720x1280
echo Ȼ�����ǽ��������շ���

:CHOICE
ECHO.
ECHO 1 - �����շ��۹ٷ�
ECHO 2 - �����շ���B ��
ECHO.
CHOICE /C:12 /N
IF errorlevel 2 goto TWO
IF errorlevel 1 goto ONE
:ONE
echo �ٷ�
%adbpath%\adb -s %device% shell am start com.hypergryph.arknights/com.u8.sdk.U8UnityContext
goto end
exit

:TWO
echo B ��
%adbpath%\adb -s %device% shell am start com.hypergryph.arknights.bilibili/com.u8.sdk.SplashActivity
goto end
EXIT

:end
echo ������MAA��·��
set /p maapath=
%maapath%.maa.exe
echo ���رոô��ڣ��ڹر�MAA�󣬽����طֱ��ʲ��Զ��ر�
%adbpath%\adb -s %device% shell wm size reset