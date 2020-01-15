$servers = Get-Content -path C:\WindowsPowerShell\Scripts\SQLserverlist.txt # If you have a file
$servers = @("Server1","server1\Instance2") # If you want to hardcode your server names. Comment out this line or the one above

$filecount = 15

write-host '============='

foreach ($server in $servers)
{
    write-host "Updating $server"
    Set-SqlErrorLog -ServerInstance $server -MaxLogCount $filecount
}