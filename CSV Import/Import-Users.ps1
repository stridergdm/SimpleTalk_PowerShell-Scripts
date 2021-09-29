[cmdletBinding()] param([parameter(mandatory)] $filename, [parameter(mandatory)] $dbserver, [parameter(mandatory)] $database, [switch] $truncate)

    $Users = Import-Csv  -Path $filename


    if ($truncate)
    {
        Invoke-Sqlcmd -ServerInstance $dbserver -database $database -query "truncate table Users_by_PowerShell"
    }

    foreach ($User in $Users)
    {                 
        $user        
        if ( [string]::IsNullOrEmpty($user.Payment_Date) )
            {$user.Payment_Date=""}
        if ( [string]::IsNullOrEmpty($user.Payment) )
            {$user.Payment="$0"}
        if ( [string]::IsNullOrEmpty($user.Notes) )
            {$user.Notes=""}
        $Users_Object  = New-Object -TypeName psobject
        $Users_Object | Add-Member -MemberType NoteProperty -name First_Name  -Value $User.'First_Name'.Replace("'","''") 
        $Users_Object | Add-Member -MemberType NoteProperty -name Last_Name  -Value $User.'Last_Name'.Replace("'","''") 
        $Users_Object | Add-Member -MemberType NoteProperty -name City  -Value $User.'City'.Replace("'","''") 
        $Users_Object | Add-Member -MemberType NoteProperty -name Payment  -Value $User.'Payment'.Replace("'","''") 
        $Users_Object | Add-Member -MemberType NoteProperty -name Payment_Date  -Value $User.'Payment_Date'.Replace("'","''") 
        $Users_Object | Add-Member -MemberType NoteProperty -name Notes  -Value $User.'Notes'.Replace("'","''") 
        
        
        $query = "exec Insert_Users_by_PowerShell @First_Name = '$($Users_Object.First_Name)', @Last_Name = '$($Users_Object.Last_Name)'
        , @City='$($Users_Object.City)', @Payment='$($Users_Object.Payment)', @Payment_Date='$($Users_Object.Payment_Date)'
        , @Notes ='$($Users_Object.Notes)'"

        try
        {
            Invoke-Sqlcmd -ServerInstance $dbserver -Database $database -Query $query -ErrorAction Stop
        }
        catch
        {
          $exception = $_.Exception.Message
          Write-debug "Error: $exception inserting $User`. Query was: $query"
        } 
    }

