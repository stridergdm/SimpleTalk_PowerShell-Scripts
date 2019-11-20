Get-Process | Out-File -FilePath .\Process.txt
#requires -Version 5.0
Compress-Archive -Path .\Process.txt -DestinationPath .\Process.zip -Force