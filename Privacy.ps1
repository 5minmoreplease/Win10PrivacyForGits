# This sets the path to the hosts file
$file = "C:\Windows\System32\drivers\etc\hosts"

# Function accepts IP and hostname and adds it to hosts
function add-hostfilecontent( [string]$ip, [string]$hostname) {
	$ip + "`t`t" + $hostname | Out-File -encoding ASCII -append $file
}

# Function accepts registry path, key name, and key value
function add-registrykey( [string]$regPath, [string]$name, [string]$value) {
	New-Item $regPath -Force | Out-Null
	New-ItemProperty $regPath -Name $name -Value $value -Force | Out-Null
}

# Hosts file entries, add an empty one by default in case the user does not have a trailing carriage return
add-hostfilecontent "" ""
add-hostfilecontent "127.0.0.1" "vortex.data.microsoft.com"
add-hostfilecontent "127.0.0.1" "vortex-win.data.microsoft.com"
add-hostfilecontent "127.0.0.1" "telecommand.telemetry.microsoft.com"
add-hostfilecontent "127.0.0.1" "telecommand.telemetry.microsoft.com.nsatc.net"
add-hostfilecontent "127.0.0.1" "oca.telemetry.microsoft.com"
add-hostfilecontent "127.0.0.1" "oca.telemetry.microsoft.com.nsatc.net"
add-hostfilecontent "127.0.0.1" "sqm.telemetry.microsoft.com"
add-hostfilecontent "127.0.0.1" "sqm.telemetry.microsoft.com.nsatc.net"
add-hostfilecontent "127.0.0.1" "watson.telemetry.microsoft.com"
add-hostfilecontent "127.0.0.1" "watson.telemetry.microsoft.com.nsatc.net"
add-hostfilecontent "127.0.0.1" "redir.metaservices.microsoft.com"
add-hostfilecontent "127.0.0.1" "choice.microsoft.com"
add-hostfilecontent "127.0.0.1" "choice.microsoft.com.nsatc.net"
add-hostfilecontent "127.0.0.1" "df.telemetry.microsoft.com"
add-hostfilecontent "127.0.0.1" "reports.wes.df.telemetry.microsoft.com"
add-hostfilecontent "127.0.0.1" "services.wes.df.telemetry.microsoft.com"
add-hostfilecontent "127.0.0.1" "sqm.df.telemetry.microsoft.com"
add-hostfilecontent "127.0.0.1" "telemetry.microsoft.com"
add-hostfilecontent "127.0.0.1" "watson.ppe.telemetry.microsoft.com"
add-hostfilecontent "127.0.0.1" "telemetry.appex.bing.net"
add-hostfilecontent "127.0.0.1" "telemetry.urs.microsoft.com"
add-hostfilecontent "127.0.0.1" "telemetry.appex.bing.net"
add-hostfilecontent "127.0.0.1" "settings-sandbox.data.microsoft.com"
add-hostfilecontent "127.0.0.1" "vortex-sandbox.data.microsoft.com"

# Get users SID
$User = New-Object System.Security.Principal.NTAccount($env:UserName)
$sid = $User.Translate([System.Security.Principal.SecurityIdentifier]).value
$sidString = 'HKLM:\SOFTWARE\Microsoft\WcmSvc\wifinetworkmanager\features\' + $sid

# Adds registry keys
add-registrykey 'HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\AdvertisingInfo' 'Enabled' '0' 
add-registrykey 'HKCU:\SOFTWARE\Microsoft\Input\TIPC' 'Enabled' '0'
add-registrykey 'HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\DataCollection' 'AllowTelemetry' '1'
add-registrykey $sidString 'FeatureStates' '828'