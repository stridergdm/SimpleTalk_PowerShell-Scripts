$servers = Get-Content -path C:\WindowsPowerShell\Scripts\SQLserverlist.txt # If you have a file
$servers = @("Server1","server1\Instance2") # If you want to hardcode your server names. Comment out this line or the one above

$registrypath = "HKLM:\Software\Microsoft\MSSQLServer\MSSQLServer"
$registryname = "NumErrorLogs"
$registryvalue = "15"

write-host '============='

foreach ($server in $servers)
{
    write-host "Updating $server"
    Invoke-Sqlcmd -Serverinstance $server -Query "EXEC xp_instance_regwrite N'HKEY_LOCAL_MACHINE', N'Software\Microsoft\MSSQLServer\MSSQLServer', N'NumErrorLogs', REG_DWORD, 15"
}