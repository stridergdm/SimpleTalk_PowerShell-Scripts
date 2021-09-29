$object = "Users"

$filename = "User_Database.csv"


$first_line = get-content $filename -First 1

$fields = $first_line.split(",").Replace('"','')

$table = "Create Table $object`_by_PowerShell
(
" 
foreach ($field in $fields)
{
    $table += "  $field nvarchar(100),
"
}
$table = $table.TrimEnd(",
")
$table += "
)"



write-host $table