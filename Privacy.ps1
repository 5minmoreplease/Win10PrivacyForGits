
$file = "C:\Windows\System32\drivers\etc\hosts"

function add-hostfilecontent( [string]$ip, [string]$hostname) {
	$ip + "`t`t" + $hostname | Out-File -encoding ASCII -append $file
}

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