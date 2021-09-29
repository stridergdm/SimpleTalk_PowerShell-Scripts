param([parameter(mandatory)] $filename)

$delimeter = ","
$fielddelimeter = '"'
$object = "Users"

$filename = "User_Database.csv"

$first_line = get-content P:$filename -First 1

$fields = $first_line.split($delimeter).Replace($fielddelimeter,'')


function create-Sql_table($object, $fields)
{

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

    return $table
}

function create-Sql_Insert_Procedure($object, $fields)
{

    $procedure = "Create or Alter Procedure Insert_$object`_by_PowerShell "
    foreach ($field in $fields)
    {
        $procedure += "@$field nvarchar(100)`, 
        "
    }    
    $procedure = $procedure.TrimEnd(", 
    ") 


    $procedure += "
    AS
    Insert into $object`_by_PowerShell  ("
    foreach ($field in $fields)
    {
        $procedure += "$field, 
        "
    }
    $procedure = $procedure.TrimEnd(", 
    ") + ")
    values ("
    foreach ($field in $fields)
    {
        $procedure += "@$field,
        "
    }    
    $procedure = $procedure.TrimEnd("
    , ") + ")"
    
    return $procedure
}

function create-PS_Object($Object, $fields)
{

$object_name = "`$"+$Object+"_Object"
$objectcreate = "$object_name  = New-Object -TypeName psobject
"
foreach($field in $fields)
    {
        $field = $field.trim('"')
        $objectcreate += "$object_name | Add-Member -MemberType NoteProperty -name $($field.replace(' ','_'))  -Value $("`$"+$object).'$($field)'.Replace(""'"",""''"") 
"
    }
    return $objectcreate
}

$createdTable = create-Sql_table -object $object -fields $fields
$createdProcedure = create-Sql_Insert_Procedure -object $object -fields $fields
$createdPS_Object = create-PS_Object -object $object -fields $fields
Write-Host "################# Create table below  #################" -BackgroundColor Red -ForegroundColor Black
Write-Host $createdTable -ForegroundColor Red
Write-Host "#################  Create proc below  #################" -BackgroundColor Yellow -ForegroundColor Black
write-host $createdProcedure -ForegroundColor Yellow
Write-Host "################# Create object below #################" -BackgroundColor Green -ForegroundColor Black
Write-host $createdPS_Object -ForegroundColor Green