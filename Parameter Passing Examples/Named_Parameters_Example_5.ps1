param ($servername, $envname='Odyessy')

if ($servername -eq $null) {
$servername = read-host -Prompt "Please enter a servername:" 
}
write-host "If this script were really going to do something, it would do it on $servername in the $envname environment"