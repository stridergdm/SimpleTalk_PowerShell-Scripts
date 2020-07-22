param([parameter(ValueFromPipeLineByPropertyName)] [string] $name, [parameter(ValueFromPipeLineByPropertyName)] [System.Management.Automation.ProviderInfo] $Provider,
[parameter(ValueFromPipeLineByPropertyName)] $free, [parameter(ValueFromPipeLineByPropertyName)] [System.Nullable[long]] $MaximumSize)
process
{
    if ($free -ne $null)
    {
        Write-Host "The PSDrive name is: $name and provider is $($Provider.Name) and free space is $([math]::round($($free/1GB),2)) GB out of $MaximumSize"
    }
    else
    {
        Write-Host "The PSDrive name is: $name and provider is $($Provider.Name)"
    }
}