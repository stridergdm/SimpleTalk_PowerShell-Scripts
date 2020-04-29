<#

.Description
This is a test file to demonstrate conflicting parameters.

#>

param([parameter(mandatory, ParameterSetName='ByEnvironment')] [validateset("ProdDB_Server","DevDB_Server")] [string] $dbserver, 
[parameter(mandatory, ParameterSetName='ByDatabase')] [validateset("sales","product")] [string] $database, 
[parameter(mandatory, ParameterSetName='ByEnvironment')] [validateset("Europe","North America","All")] [string] $region,
[string] $comment) 







if ($dbserver)
{    
    Write-Host "Your code will be deployed to the $dbserver server in the $region region."
}

if ($database)
{
    Write-Host "Your code will be deployed to the $database database"
}
if ($comment)
{
    Write-host "Your comment was: $comment"
}
