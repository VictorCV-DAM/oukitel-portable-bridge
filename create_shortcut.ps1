$sh = New-Object -ComObject WScript.Shell
$desktop = [System.Environment]::GetFolderPath([System.Environment+SpecialFolder]::Desktop)
$lnkPath = Join-Path $PSScriptRoot "Oukitel MQTT Bridge.lnk"
$targetPath = Join-Path $PSScriptRoot "start_bridge.bat"
$iconPath = Join-Path $PSScriptRoot "icon.ico"

# Create in current directory
$shortcut = $sh.CreateShortcut($lnkPath)
$shortcut.TargetPath = $targetPath
$shortcut.WorkingDirectory = $PSScriptRoot
$shortcut.IconLocation = "$iconPath,0"
$shortcut.Description = "Oukitel Power Station MQTT Bridge"
$shortcut.Save()
Write-Host "✅ Created shortcut in folder: $lnkPath" -ForegroundColor Green

# Optional: Also create or update on Desktop
$desktopLnk = Join-Path $desktop "Oukitel MQTT Bridge.lnk"
$scDesktop = $sh.CreateShortcut($desktopLnk)
$scDesktop.TargetPath = $targetPath
$scDesktop.WorkingDirectory = $PSScriptRoot
$scDesktop.IconLocation = "$iconPath,0"
$scDesktop.Description = "Oukitel Power Station MQTT Bridge"
$scDesktop.Save()
Write-Host "✅ Created shortcut on Desktop: $desktopLnk" -ForegroundColor Green
