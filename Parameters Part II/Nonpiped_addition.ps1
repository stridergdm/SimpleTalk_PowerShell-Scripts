param( $addends)
$sum=0
foreach ($addend in $addends)
{
    $sum+=$addend
}

Write-Host "The final value is $sum"