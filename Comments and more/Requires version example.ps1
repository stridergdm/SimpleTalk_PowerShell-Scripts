#requires -Version 5.0
Get-Process | Out-File -FilePath .\Process.txt
Compress-Archive -Path .\Process.txt -DestinationPath .\Process.zip -Force