@echo off &setlocal
::Gets users profile id, used to turn off Wi-Fi Sense
set cmd="wmic useraccount where name='%username%' get sid"
for /f "skip=1" %%i IN ( ' %cmd% ' ) DO if not defined SID set "SID=%%i"
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
echo Disabling Microsoft Keylogger/Sending info on how you write
reg add HKEY_CURRENT_USER\SOFTWARE\Microsoft\Input\TIPC /t REG_DWORD /v Enabled /d 0 /f
echo Setting Telemetry to Basic
reg add HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\DataCollection\ /t REG_DWORD /v AllowTelemetry /d 1 /f
echo Turning off Wi-Fi Sense
reg add HKLM\SOFTWARE\Microsoft\WcmSvc\wifinetworkmanager\features\%SID% /v FeatureStates /f /t REG_DWORD /d 828
echo Done!
pause
exit