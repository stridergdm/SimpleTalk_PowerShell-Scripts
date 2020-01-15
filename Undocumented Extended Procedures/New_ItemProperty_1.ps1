$registrypath = "HKLM:\Software\Microsoft\MSSQLServer\MSSQLServer"
$registryname = "NumErrorLogs"
$registryvalue = 15

New-ItemProperty -Path $registrypath -Name $registryname -Value $registryvalue -PropertyType DOUBLE -WhatIf