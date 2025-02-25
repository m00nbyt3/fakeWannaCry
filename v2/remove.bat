taskkill -F -IM chrome.exe
reg delete "HKCU\Software\Microsoft\Windows\CurrentVersion\RunOnce" /v WindowsSecurity /f
explorer.exe