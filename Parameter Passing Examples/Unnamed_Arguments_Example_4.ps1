write-host "There are a total of $($args.count) arguments"
for ( $i = 0; $i -lt $args.count; $i++ ) {
    $diskdata = get-PSdrive $args[$i] | Select-Object Used,Free
    write-host "$($args[$i]) has  $($diskdata.Used) Used and $($diskdata.Free) free"
}


