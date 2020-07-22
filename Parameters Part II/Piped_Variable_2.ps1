param([parameter(ValueFromPipeline)] $piped2)
begin  #Note the begin block is optional!
{
    Write-host "Will only run once at the start!"
}
Process  #This is the part that does all the work
{ 
    Write-host $piped2
}
end   #Note that the end block is also optional!
{
    Write-Host "Will only run at the end"
}