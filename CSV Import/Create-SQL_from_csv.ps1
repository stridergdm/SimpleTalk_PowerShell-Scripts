
$object = "Users"

$filename = "User_Database.csv"


$first_line = get-content P:\$filename -First 1

$fields = $first_line.split(",").Replace('"','')


function create-Sql_table($object, $fields)
{

    $table = "Create Table $object`_by_PowerShell
    (
    " 
    foreach ($field in $fields)
    {
        $table += "  $field nvarchar(100)
    "
    }
    $table += ")"

    return $table
}

function create-Sql_Insert_Procedure($object, $fields)
{

    $procedure = "Create or Alter Procedure Insert_$object "
    foreach ($field in $fields)
    {
        $procedure += "@$field nvarchar(100)`, 
        "
    }    
    $procedure = $procedure.TrimEnd(", 
    ") 


    $procedure += "
    AS
    Insert into $object ("
    foreach ($field in $fields)
    {
        $procedure += "$field`, 
        "
    }
    $procedure = $procedure.TrimEnd(", 
    ") + ")
    values ("
    foreach ($field in $fields)
    {
        $procedure += "@$field` ,
        "
    }    
    $procedure = $procedure.TrimEnd("
    , ") + ")"
    
    return $procedure
}


$createdTable = create-Sql_table -object $object -fields $fields
$createdProcedure = create-Sql_Insert_Procedure -object $object -fields $fields
Write-Host $createdTable
write-host $createdProcedure