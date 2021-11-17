write-host "1) " -ForegroundColor Red -NoNewline
write-host "select Option 1" -ForegroundColor Yellow
write-host "2) " -ForegroundColor Red -NoNewline
write-host "select Option 2" -ForegroundColor Yellow
write-host "3) " -ForegroundColor Red -NoNewline
write-host "select Option 3" -ForegroundColor Yellow

$result = Read-host "Select an option above"
if ($result -ge 1 -and $result -le 3)
    { Write-host "Thank you for selecting $result" }
else
    { "You selected an invalid value $result" }
