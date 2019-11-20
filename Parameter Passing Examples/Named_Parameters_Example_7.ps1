param($drives)
foreach ($drive in $drives) 
{
    $diskdata = get-PSdrive $drive | Select-Object Used,Free
    write-host "$($drive) has  $($diskdata.Used) Used and $($diskdata.Free) free"
}
