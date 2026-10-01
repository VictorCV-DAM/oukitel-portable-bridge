# Oukitel P2001 - Home Assistant MQTT Bridge (V4 Cloud)
[Console]::Title = "Extraer datos OUKITEL MQTT"
$Host.UI.RawUI.WindowTitle = "Extraer datos OUKITEL MQTT"
Write-Host -NoNewline "$([char]27)]0;Extraer datos OUKITEL MQTT`a"
# Establecer el directorio de trabajo a la ubicación del script
Set-Location -Path $PSScriptRoot

Write-Host "========================================" -ForegroundColor Cyan
Write-Host "   Oukitel P2001 Plus - MQTT Bridge V4" -ForegroundColor Cyan
Write-Host "   Cloud API | Portable Python 3.10" -ForegroundColor Cyan
Write-Host "========================================" -ForegroundColor Cyan
Write-Host ""

# Ejecutar Python portable con la ruta al script de Python
& "$PSScriptRoot\python_portable\python.exe" "$PSScriptRoot\oukitel_cloud_mqtt.py"

Write-Host ""
Write-Host "[FIN] El script ha terminado." -ForegroundColor Green

Read-Host -Prompt "Presiona Enter para salir..."