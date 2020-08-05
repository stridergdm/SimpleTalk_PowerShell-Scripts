param([parameter(mandatory)][validateset('Good','Bad')] $status)

Write-host "Status is $status"

$status = 'Ugly'

Write-host "Status is still $status"

$status = 'Good'

Write-host "Status is now $status"