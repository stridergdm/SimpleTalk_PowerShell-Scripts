   #requires -Version 5.0

try
{
    write-host "We're at version 5.0!"
#requires -Version 5.0
}
catch
{
    write-host "Hey, we're not at version 5!"
}