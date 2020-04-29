param([parameter(mandatory, ParameterSetName='ByEnvironment')] [validateset("ProdDB_Server","DevDB_Server")] [string] $dbserver, 
[parameter(mandatory, ParameterSetName='ByDatabase')] [validateset("sales","product")] [string] $database ) 

if ($dbserver)
{
    Write-Host "Your code will be deployed to the $dbserver server"
}

if ($database)
{
    Write-Host "Your code will be deployed to the $database database"
}