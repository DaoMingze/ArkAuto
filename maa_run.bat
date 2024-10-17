chcp 65001
@echo off
title MAA start
set adbpath=".\platform-tools"
%adbpath%\adb devices
%adbpath%\adb shell wm size 1080x1920