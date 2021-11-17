# Setup our variables

$cost = 144.56
$quantity = 11

# So far so good
Write-host "Your cost for $quantity will be: $($cost*$quantity)"

# Hmm, this doesn't look as good.
$quantity = 10
Write-host "Your cost for $quantity will be: $($cost*$quantity)"

# A first attempt
$formatted = "Your cost for {0} will be: {1:f2}" -f $quantity, $($quantity*$cost)
write-host $formatted

# Better
$formatted = "Your cost for {0} will be: `${1:n2}" -f $quantity, $($quantity*$cost)
write-host $formatted

# Best
$formatted = "Your cost for {0} will be: {1:c2}" -f $quantity, $($quantity*$cost)
write-host $formatted

# Generate 15 userIDs
1..15 | % { 'UserID_{0:d4}' -f $_ }

# Dates
# No formatting
$exampledate = get-date
write-host $exampledate

# Formatted Date 1
$fdate = get-date -Format "yyyy-MM-dd"
write-host $fdate


$fdate = get-date -Format "R"
write-host $fdate

# Formatted Date
write-host $exampledate.ToString('yyyy-MM-dd')
Write-Host $exampledate.ToString("HH:mm:ss")
