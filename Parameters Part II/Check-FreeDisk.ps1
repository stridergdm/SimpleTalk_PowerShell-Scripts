param([parameter(ValueFromPipeLineByPropertyName)] [string] $name, [parameter(ValueFromPipeLineByPropertyName)] [System.Management.Automation.ProviderInfo] $Provider,
[parameter(ValueFromPipeLineByPropertyName)] $free, $buymore)
process
{
    if ($free -ne $null)
    {
        Write-Host "The PSDrive name is: $name and provider is $($Provider.Name) and free space is $([math]::round($($free/1GB),2)) GB"
        if ($([math]::round($($free/1GB),2)) -lt $buymore)
        {
            write-host "==================> Time to think about upgrading! $name" -ForegroundColor Red
        }
    }
}