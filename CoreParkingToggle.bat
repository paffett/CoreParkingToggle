@echo off
REM ---------------------------------------------------------------
REM CoreParkingToggle.bat
REM Wrapper to run CoreParkingToggle.ps1 with ExecutionPolicy Bypass
REM ---------------------------------------------------------------

PowerShell.exe -NoProfile -ExecutionPolicy Bypass -File "%~dp0CoreParkingToggle.ps1"

REM Pause so you can read any output before the window closes
pause
REM ---------------------------------------------------------------
REM End of CoreParkingToggle.bat    