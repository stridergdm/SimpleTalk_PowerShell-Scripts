$person1= @{Name='Greg' 
Age=53}
# Let's check the contents of the object
$person1

# First attempt to write out details
write-host $person1

# Second attempt to write out details
write-host "This is all about $person1"

# Third attempt
$person1.Name, $person1.Age

# Fourth attempt
write-host "This is all about $person1.Name"

# A work around
$personName = $person1.Name
write-host "This is all about $personName"

# Doing it all inline, cleanly.
write-host "This is all about $($person1.Name) who is $($person1.Age)"

$person2 = @{Name="Joe"
Age=78}

write-host "Together $($person1.Name) and $($person2.Name) are a total of $($person1.Age + $person2.Age) years old."