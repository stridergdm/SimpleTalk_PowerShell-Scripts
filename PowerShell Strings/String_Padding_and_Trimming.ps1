$3char = "123 "  # note space!
$4char = "4567"


write-host $3char
Write-Host $4char

# But what if we want them to line up, and we expect someday we might even have longer strings.

$padamount = 5
$padcharacter = ' '
write-host $3char.PadLeft($padamount,$padcharacter)
Write-Host $4char.PadLeft($padamount,$padcharacter)


write-host $3char.trim().PadLeft($padamount,$padcharacter)
Write-Host $4char.PadLeft($padamount,$padcharacter)


$padamount = 7
$padcharacter = '.'
write-host $3char.PadRight($padamount,$padcharacter)
Write-Host $4char.PadRight($padamount,$padcharacter)



write-host $3char.trim().PadRight($padamount,$padcharacter)
Write-Host $4char.PadRight($padamount,$padcharacter)