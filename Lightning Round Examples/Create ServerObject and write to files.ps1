$filepath_text = "$env:HOMEDRIVE$env:HOMEPATH\sqlserverobjectlist.txt" 
$filepath_json = "$env:HOMEDRIVE$env:HOMEPATH\sqlserverobjectlist.json" 


"[" | Out-File -FilePath $filepath_json

$serverObject = New-Object -TypeName psobject
$serverObject | Add-Member -MemberType NoteProperty -Name ComputerName -Value "one"
$serverObject | Add-Member -MemberType NoteProperty -Name Environment -Value "PROD"
$serverObject | Add-Member -MemberType NoteProperty -Name SQLVersion -Value "2016"
$serverObject | Add-Member -MemberType NoteProperty -Name OSVersion -Value "2012"
$serverObject | Add-Member -MemberType NoteProperty -Name Products -Value @("FOO","BAR")

$serverObject | out-file -FilePath $filepath_text
ConvertTo-Json $serverObject | out-file -FilePath $filepath_json -Append


"," | Out-File -FilePath $filepath_json -Append
$serverObject = New-Object -TypeName psobject
$serverObject | Add-Member -MemberType NoteProperty -Name ComputerName -Value "TWO"
$serverObject | Add-Member -MemberType NoteProperty -Name Environment -Value "DR"
$serverObject | Add-Member -MemberType NoteProperty -Name SQLVersion -Value "2016"
$serverObject | Add-Member -MemberType NoteProperty -Name OSVersion -Value "2012"
$serverObject | Add-Member -MemberType NoteProperty -Name Products -Value @("FOO","BAR")

$serverObject | out-file -FilePath $filepath_text -Append
ConvertTo-Json $serverObject | out-file -FilePath "$env:HOMEDRIVE$env:HOMEPATH\sqlserverobjectlist.json" -Append

"," | Out-File -FilePath $filepath_json -Append
$serverObject = New-Object -TypeName psobject
$serverObject | Add-Member -MemberType NoteProperty -Name ComputerName -Value "THREE"
$serverObject | Add-Member -MemberType NoteProperty -Name Environment -Value "PROD"
$serverObject | Add-Member -MemberType NoteProperty -Name SQLVersion -Value "2019"
$serverObject | Add-Member -MemberType NoteProperty -Name OSVersion -Value "2012"
$serverObject | Add-Member -MemberType NoteProperty -Name Products -Value @("FIZ","BIN","BAZ")

$serverObject | out-file -FilePath $filepath_text -Append
ConvertTo-Json $serverObject | out-file -FilePath "$env:HOMEDRIVE$env:HOMEPATH\sqlserverobjectlist.json" -Append


"]" | Out-File -FilePath $filepath_json -Append