# Presented as a quick demo for a lightning round.
# This is NOT productin quality code!
# As was pointed out to me after the user group meeting, there are a number of improvements one could make to the code.
# As they say in college, I leave those as an exercise for the reader.
# (Though a hint, one could use a WHERE search instead of the IF)
param([string]$environment, $version)

    $serverobjlist = Get-Content -Raw -Path "$env:HOMEDRIVE$env:HOMEPATH\sqlserverobjectlist.json" | ConvertFrom-Json

if ($environment -eq "" -and $version -ne "")
{
    foreach ($server in $serverobjlist)
    {
    
        if ($version -eq $server.SQLVersion)
        {
                    Write-Host "The following operation will be done on server $($Server.ComputerName) in the $($Server.Environment) Environment which is running SQL Server Version: $version"
        }
    }
    return
}
else

{
    foreach ($server in $serverobjlist)
    {
    
        if ($environment -eq $server.Environment)
        {
                    Write-Host "The following operation will be done on server $($Server.ComputerName) in the $($Server.Environment) Environment"
        }
    }
}