Stop-Process -Name 'chrome' -Force;
Start-Process 'taskkill.exe' -ArgumentList '-F -IM explorer.exe';

$fullPath = Resolve-Path .\index.html
Start-Process 'chrome.exe' $fullPath;