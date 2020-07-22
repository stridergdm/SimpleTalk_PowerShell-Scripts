param([parameter(ValueFromPipeline)] [string] $name, [parameter(ValueFromPipeline)] $Provider)
process
{
    Write-Host "The name is: $name and provider is $Provider"
}