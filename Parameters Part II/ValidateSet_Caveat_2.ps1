param([validateset('Lorca','Georgiou','Pike','Kirk')] $Captain, $color)

[validateSet('red','yellow')] $alert = 'red'
[validateSet('good','bad')] $status

Write-host "Captain $Captain has declared $alert alert and our status is $status!"
$alert = $color
$status = 'REALLY BAD'
Write-host "Now Captain $Captain has declared $alert alert and our status is $status!"