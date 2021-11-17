$tod = get-date

if ($tod.Hour -ge 6 -and $tod.Hour -lt 9)
    {
        write-host "Time for Breakfast!" -ForegroundColor Yellow
    }
elseif ($tod.Hour -ge 9 -and $tod.Hour -lt 11)
    {
        write-host "Time for 2nd Breakfast!" -ForegroundColor Red -BackgroundColor Green
        write-host "That's only if he knows about second breakfast!"           
    }    
elseif ($tod.Hour -ge 11 -and $tod.Hour -lt 12)
    {
        write-host "Elevenses!" -BackgroundColor Red
    }    
elseif ($tod.Hour -ge 12 -and $tod.Hour -lt 14)
    {
        write-host "Luncheon" -ForegroundColor Red -BackgroundColor Yellow
    }
else
    {
        Write-host "Afternoon Tea - 2:00 PM until 5:00 PM " -ForegroundColor Black -BackgroundColor DarkRed -NoNewline
        Write-host "Dinner - 7:00 PM until 9:00 PM " -ForegroundColor Red -BackgroundColor DarkBlue -NoNewline
        Write-host "Supper - 9:00 PM until 11:00 PM " -ForegroundColor Red -BackgroundColor DarkGreen
    }
    