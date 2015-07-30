@echo off
echo ====================================================
echo Windows 10 Privacy for Gits
echo Licensed under the GNU GPL2 (enclosed with program)
echo This program must be run as admin!
echo ====================================================
echo Do you want to start the process? [y/n]
set /p start=
if "%start%" == "y" goto privacystart
if "%start% == "n" exit
:privacystart
echo Turning off Advertising ID Sharing
reg add HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\AdvertisingInfo /t REG_DWORD /v Enabled /d 0 /f
echo Done!
pause
exit