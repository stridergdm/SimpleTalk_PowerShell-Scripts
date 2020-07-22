param([parameter(mandatory)] [validateset("ProdDB_Server","DevDB_Server")] [string] $dbserver )

write-host "You picked $dbserver!"