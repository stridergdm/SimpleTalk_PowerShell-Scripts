#This is an example of single-line comments
#
#Author: Greg D. Moore greg@quicr.net
#Date: 2019-11-12
#Version: 1.0
#



<#This is an example of a block comment

Author: Greg D. Moore greg@quicr.net
Date: 2019-11-12
Version: 1.0
#>

#This is a comment starting at the beginning of a line.

get-help write-host # This is a comment appended to the end of a line

get-help write-host #Ooops, I don't want to go -online 

get-help write-host <# I want the most recent, so I'll go online #> -online 

write-host Press # on your phone

write-host Press `# on your phone

write-host 'Press # on your phone'

return  # this allows you to run the script w/o the lines below blowing up.

I wrote these lines
and now I want to comment them.
I should have typed an octothorpe, 
or as kids call them these days
a hashtag at the start of each line.
Oops now I have to go back and type
a lot of `#s.
Or do I?