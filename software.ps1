# Define a list of software options
$softwareList = @(
    @{ Name = "Google Chrome"; PackageId = "Google.Chrome" },
    @{ Name = "Mozilla Firefox"; PackageId = "Mozilla.Firefox" },
    @{ Name = "Visual Studio Code"; PackageId = "Microsoft.VisualStudioCode" },
    @{ Name = "Notepad++"; PackageId = "Notepad++.Notepad++" },
    @{ Name = "Git"; PackageId = "Git.Git" },
    @{ Name = "7-Zip"; PackageId = "7zip.7zip" },
    @{ Name = "VLC Media Player"; PackageId = "VideoLAN.VLC" },
    @{ Name = "Bitwarden"; PackageId = "Bitwarden.Bitwarden" },
    @{ Name = "Steam"; PackageId = "Valve.Steam" },
    @{ Name = "Tidal"; PackageId = "TIDAL.TIDAL" },
    @{ Name = "Beersmith"; PackageId = "BeerSmith.BeerSmith3" },
    @{ Name = "NordVPN"; PackageId = "NordVPN.NordVPN" },
    @{ Name = "Slack"; PackageId = "SlackTechnologies.Slack" },
    @{ Name = "ChatGPT"; PackageId = "OpenAI.ChatGPT" },
    @{ Name = "NVIDIA GeForce Experience"; PackageId = "NVIDIA.GeForceExperience" },
    @{ Name = "FileZilla"; PackageId = "FileZilla.FileZilla" }
    @{ Name = "FFmpeg"; PackageId = "Gyan.FFmpeg" }
    @{ Name = "TranslucentTB"; PackageId = "CharlesMilette.TranslucentTB" }
    @{ Name = "Caffeine"; PackageId = "ZhornSoftware.Caffeine" }
)

# Display menu
Write-Host "Select apps to install:" -ForegroundColor Cyan
$counter = 1
foreach ($software in $softwareList) {
    Write-Host "$counter. $($software.Name)"
    $counter++
}

# Prompt user for input
Write-Host ""
$selections = Read-Host "Choose numbers (comma-separated, e.g., 1,3,5)"

# Validate and process input
$selections = $selections -split "," | ForEach-Object { $_.Trim() -as [int] }
$validSelections = $selections | Where-Object { $_ -ge 1 -and $_ -le $softwareList.Count }

if ($validSelections.Count -eq 0) {
    Write-Host "No valid selections made. Exiting." -ForegroundColor Red
    exit
}

# Install selected software
foreach ($index in $validSelections) {
    $software = $softwareList[$index - 1]
    Write-Host "Installing $($software.Name)..." -ForegroundColor Green
    winget install --id $($software.PackageId) --silent
}

Write-Host "All apps installed!" -ForegroundColor Cyan
