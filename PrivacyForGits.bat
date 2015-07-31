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
echo Blocking Telemetry in hosts file
@echo 127.0.0.1 vortex.data.microsoft.com >> C:\Windows\System32\drivers\etc\hosts
@echo 127.0.0.1 vortex-win.data.microsoft.com >> C:\Windows\System32\drivers\etc\hosts
@echo 127.0.0.1 telecommand.telemetry.microsoft.com >> C:\Windows\System32\drivers\etc\hosts
@echo 127.0.0.1 telecommand.telemetry.microsoft.com.nsatc.net >> C:\Windows\System32\drivers\etc\hosts
@echo 127.0.0.1 oca.telemetry.microsoft.com >> C:\Windows\System32\drivers\etc\hosts
@echo 127.0.0.1 oca.telemetry.microsoft.com.nsatc.net >> C:\Windows\System32\drivers\etc\hosts
@echo 127.0.0.1 sqm.telemetry.microsoft.com >> C:\Windows\System32\drivers\etc\hosts
@echo 127.0.0.1 sqm.telemetry.microsoft.com.nsatc.net >> C:\Windows\System32\drivers\etc\hosts
@echo 127.0.0.1 watson.telemetry.microsoft.com >> C:\Windows\System32\drivers\etc\hosts
@echo 127.0.0.1 watson.telemetry.microsoft.com.nsatc.net >> C:\Windows\System32\drivers\etc\hosts
@echo 127.0.0.1 redir.metaservices.microsoft.com >> C:\Windows\System32\drivers\etc\hosts
@echo 127.0.0.1 choice.microsoft.com >> C:\Windows\System32\drivers\etc\hosts
@echo 127.0.0.1 choice.microsoft.com.nsatc.net >> C:\Windows\System32\drivers\etc\hosts
@echo 127.0.0.1 df.telemetry.microsoft.com  >> C:\Windows\System32\drivers\etc\hosts
@echo 127.0.0.1 reports.wes.df.telemetry.microsoft.com >> C:\Windows\System32\drivers\etc\hosts
@echo 127.0.0.1 services.wes.df.telemetry.microsoft.com >> C:\Windows\System32\drivers\etc\hosts
@echo 127.0.0.1 sqm.df.telemetry.microsoft.com >> C:\Windows\System32\drivers\etc\hosts
@echo 127.0.0.1 telemetry.microsoft.com >> C:\Windows\System32\drivers\etc\hosts
@echo 127.0.0.1 watson.ppe.telemetry.microsoft.com >> C:\Windows\System32\drivers\etc\hosts
@echo 127.0.0.1 telemetry.appex.bing.net >> C:\Windows\System32\drivers\etc\hosts
@echo 127.0.0.1 telemetry.urs.microsoft.com >> C:\Windows\System32\drivers\etc\hosts
@echo 127.0.0.1 telemetry.appex.bing.net:443 >> C:\Windows\System32\drivers\etc\hosts
@echo 127.0.0.1 settings-sandbox.data.microsoft.com >> C:\Windows\System32\drivers\etc\hosts
@echo 127.0.0.1 vortex-sandbox.data.microsoft.com >> C:\Windows\System32\drivers\etc\hosts
echo Turning off Wi-Fi Sense
reg add HKLM\SOFTWARE\Microsoft\WcmSvc\wifinetworkmanager\features\%SID% /v FeatureStates /f /t REG_DWORD /d 828
echo Done!
pause
exit