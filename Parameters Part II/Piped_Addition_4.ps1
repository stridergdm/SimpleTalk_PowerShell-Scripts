param([parameter(ValueFromPipeline)] $addends)

Process 
{ 
    $addends.gettype() # Let's reveal the datatype here!

    foreach ($addend in $addends)
    {
        $sum+=$addend
    }
    Write-Host "In Process block: Total = $sum"
}
