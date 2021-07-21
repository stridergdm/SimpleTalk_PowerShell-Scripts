$object = "Users"

$filename = "User_Database.csv"


$first_line = get-content P:\$filename -First 1

$fields = $first_line.split(",").Replace('"','')

$table = "Create Table $object`_by_PowerShell
(
" 
foreach ($field in $fields)
{
    $table += "  $field nvarchar(100)
"
}
$table += ")"

write-host $table