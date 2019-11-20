Get-Process | Out-File -FilePath .\Process.txt

if ($PSVersionTable.PSVersion.Major -ge 5)
{
    Compress-Archive -Path .\Process.txt -DestinationPath .\Process.zip -Force
}
else
{
    Write-Host "I'm sorry Dave, I can't do that."
}