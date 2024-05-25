# Get path for Winget executible
$Winget = ((gci "C:\Program Files\WindowsApps" -Recurse -File | Where-Object { ($_.fullname -match 'C:\\Program Files\\WindowsApps\\Microsoft.DesktopAppInstaller_' -and $_.name -match 'winget.exe') } | sort fullname -descending | %{$_.FullName}) -Split [Environment]::NewLine)[0]

# WinGet version
echo $winget
& "$Winget" --info

# Update source
& "$Winget" source update

# Run the upgrade command