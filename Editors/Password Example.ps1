[CmdletBinding()] param (    [Parameter()] [string] $password )

 $filename = "c:\temp\insecure_password.txt"
 $counter = 5
 $list = @("one","two","three")

 [int] $intcounter = 6
Write-host "Your Password is $password and I will write it to $filename"
write-host "Counter is: $counter"
write-host "IntCounter is $intcounter"


