param([parameter(ValueFromPipeLineByPropertyName)] [string] $name, [parameter(ValueFromPipeLineByPropertyName)] [System.Management.Automation.ProviderInfo] $Provider)
process
{
    Write-Host "The PSDrive name is: $name and provider is $($Provider.Name)"
}