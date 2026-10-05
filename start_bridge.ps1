# Oukitel Power Stations - MQTT Bridge (Standalone & Cross-Platform)
[Console]::Title = "Oukitel Power Station MQTT Bridge"
$Host.UI.RawUI.WindowTitle = "Oukitel Power Station MQTT Bridge"
Write-Host -NoNewline "$([char]27)]0;Oukitel Power Station MQTT Bridge`a"
Set-Location -Path $PSScriptRoot

# Set Windows Console Window & Taskbar Icon if available
$iconPath = Join-Path $PSScriptRoot "icon.ico"
if ([System.IO.File]::Exists($iconPath)) {
    try {
        $sig = @'
        [DllImport("user32.dll")]
        public static extern IntPtr SendMessage(IntPtr hWnd, uint Msg, IntPtr wParam, IntPtr lParam);
        [DllImport("user32.dll")]
        public static extern IntPtr LoadImage(IntPtr hInst, string lpszName, uint uType, int cxDesired, int cyDesired, uint fuLoad);
        [DllImport("kernel32.dll")]
        public static extern IntPtr GetConsoleWindow();
'@
        if (-not ([System.Management.Automation.PSTypeName]"OukitelBridge.Win32IconHelper").Type) {
            Add-Type -MemberDefinition $sig -Name "Win32IconHelper" -Namespace "OukitelBridge" | Out-Null
        }
        $hWnd = [OukitelBridge.Win32IconHelper]::GetConsoleWindow()
        if ($hWnd -ne [IntPtr]::Zero) {
            # LoadIcon small (16x16) and big (32x32)
            $hIconSmall = [OukitelBridge.Win32IconHelper]::LoadImage([IntPtr]::Zero, $iconPath, 1, 16, 16, 0x00000010)
            $hIconBig   = [OukitelBridge.Win32IconHelper]::LoadImage([IntPtr]::Zero, $iconPath, 1, 32, 32, 0x00000010)
            if ($hIconSmall -ne [IntPtr]::Zero) {
                [OukitelBridge.Win32IconHelper]::SendMessage($hWnd, 0x0080, [IntPtr]0, $hIconSmall) | Out-Null # WM_SETICON ICON_SMALL
            }
            if ($hIconBig -ne [IntPtr]::Zero) {
                [OukitelBridge.Win32IconHelper]::SendMessage($hWnd, 0x0080, [IntPtr]1, $hIconBig) | Out-Null   # WM_SETICON ICON_BIG
            }
        }
    } catch {
        # Silently proceed if pinvoke is not supported
    }
}

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