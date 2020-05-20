<#

.Description
This is a test file to demonstrate conflicting parameters.

.PARAMETER dbserver
Help here overrides what's in the parameter definition.

.PARAMETER database
Determines if you are deploying to the Sales or Product database. Valid values are sales or product
May not be used with the dbServer and region parameters

.PARAMETER region
Determines which region you are deploying to. Valid values are Europe, North America or All
Must be used with the dbserver parameter. May not be used with the database parameter

.PARAMETER Comment
Allows you to add a comment to your deploy.

.EXAMPLE
PS> .\Conflicting_Parameters_Help3 -dbserver ProdDB_Server -region 'North America' -Comment 'deployment by server and region example!'

.EXAMPLE
PS> .\Conflicting_Parameters_Help3 -database Sales -Comment 'deployment by database example!'

.SYNOPSIS
Used to determine where files should be deployed.

.Link

https://github.com/stridergdm/SimpleTalk_PowerShell-Scripts/tree/master/More%20Parameters%20and%20Help


#>

param([parameter(mandatory, ParameterSetName='ByEnvironment')] [validateset("ProdDB_Server","DevDB_Server")] # Determines if you are deploying to the Production or Dev DB server. Valid values are ProdDB_Server or DevDB_Server Must be used with the region parameter. May not be used with the database parameter 
[string] $dbserver, 
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
