param([parameter(ValueFromPipeline)] $addends)
begin  #Note the begin block is optional!
{
    $sum=0
    if ($addends.count -gt 0)
    {
        write-host "Values are not piped!"
        $piped = $false
    }
    else
    {
        $piped = $true
        Write-Host "Values are piped!"
    }
}
Process  #This is the part that does all the work
{ 
    if ($piped)
        {
            $sum+=$addends
        }
    else
        {
            foreach ($addend in $addends)
            {
                $sum+=$addend
            }
        }

}
end   #Note that the end block is also optional!
{
    Write-Host "The sum of your numbers is $sum"
}