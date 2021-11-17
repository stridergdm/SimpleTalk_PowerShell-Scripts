$name = "Greg"
$age = 53

"My name is $name and my age is $age."

$string1 = "The `$name value is $name and the `$age value is $age."
$string2 = 'The $name value is ' + $name + ' and the $age value is ' + $age
$string3 = 'The $name value is ' + $name + " and the `$age value is $age"

write-host $string1
write-host $string2
write-host $string3


