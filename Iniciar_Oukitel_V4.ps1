# Oukitel P2001 / Power Stations - Home Assistant MQTT Bridge (Standalone)
[Console]::Title = "Oukitel Power Station MQTT Bridge"
$Host.UI.RawUI.WindowTitle = "Oukitel Power Station MQTT Bridge"
Write-Host -NoNewline "$([char]27)]0;Oukitel Power Station MQTT Bridge`a"
Set-Location -Path $PSScriptRoot

Write-Host "========================================" -ForegroundColor Cyan
Write-Host "   Oukitel Power Station - MQTT Bridge" -ForegroundColor Cyan
Write-Host "   Cloud API | Standalone Service" -ForegroundColor Cyan
Write-Host "========================================" -ForegroundColor Cyan
Write-Host ""

# Run python script
if (Test-Path "$PSScriptRoot\python_portable\python.exe") {
    & "$PSScriptRoot\python_portable\python.exe" "$PSScriptRoot\oukitel_cloud_mqtt.py"
} else {
    python "$PSScriptRoot\oukitel_cloud_mqtt.py"
}

Write-Host ""
Write-Host "[END] Bridge execution stopped." -ForegroundColor Green

Read-Host -Prompt "Press Enter to exit..."