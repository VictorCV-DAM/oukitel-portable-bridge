@echo off
title Oukitel Power Station MQTT Bridge
cd /d "%~dp0"
powershell.exe -ExecutionPolicy Bypass -NoExit -Command "& '%~dp0start_bridge.ps1'"
if %ERRORLEVEL% NEQ 0 (
    echo.
    echo [ERROR] Bridge process exited with code %ERRORLEVEL%.
    pause
)