param([parameter(ValueFromPipeline)] $addends)
begin  #Note the begin block is optional!
{
    $sum=0
}
Process  #This is the part that does all the work
{ 
    $sum+=$addends
}
end   #Note that the end block is also optional!
{
    Write-Host "The sum of your numbers is $sum"
}