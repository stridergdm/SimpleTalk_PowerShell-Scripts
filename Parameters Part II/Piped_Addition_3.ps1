param([parameter(ValueFromPipeline)] $addends)

Process 
{ 
    foreach ($addend in $addends)
    {
        $sum+=$addend
    }
    Write-Host "In Process block: Total = $sum"
}
