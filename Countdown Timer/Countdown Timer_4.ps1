param([int]$delay=3, [string]$EventLabel = "The presentation will start shortly.")



#Get monitor resolution of primary monitor

$monitordetails = [System.Windows.Forms.SystemInformation]::PrimaryMonitorSize
$monitorheight = $monitordetails.Height
$monitorwidth = $monitordetails.Width


#Setup initial form
$Counter_Form = New-Object System.Windows.Forms.Form
$Counter_Form.Text = "Countdown Timer!"
$Counter_Form.Height = $monitorheight * .80
$Counter_Form.Width = $monitorwidth * .80
$Counter_Form.WindowState = "Normal"
$Counter_Form.Top = $monitorheight *.10
$Counter_Form.Left = $monitorwidth *.10


$Counter_Form.StartPosition = "manual"     # this ensure we can control where on the screen the form appears




#Setup our Normal font
$normalfont = New-Object System.Drawing.Font("Times New Roman",28)   # We will use this size and type of font throughout

#Setup initial label
$Counter_Label = New-Object System.Windows.Forms.Label
$Counter_Label.ForeColor = "Green"
$Counter_Label.Font = $normalfont


#setup input areas
# This will let prompt for the delay if it wasn't passed in on the command line.

$Counter_GetDelay_Label = New-Object System.Windows.Forms.Label
$Counter_GetDelay_Label.Width = 70
$Counter_GetDelay_Label.Height = 20
$Counter_GetDelay_Label.Text = "Enter Delay:"
$Counter_GetDelay_Label.Left = 10
$Counter_GetDelay_Label.Top = 8
$Counter_Form.Controls.Add($Counter_GetDelay_Label)


$Counter_GetDelay_TextBox = New-Object System.Windows.Forms.TextBox
$Counter_GetDelay_TextBox.Width = 30
$Counter_GetDelay_TextBox.Height = 20
$Counter_GetDelay_TextBox.Text = $delay
$Counter_GetDelay_TextBox.Left = 80
$Counter_GetDelay_TextBox.Top = 5
$Counter_Form.Controls.Add($Counter_GetDelay_TextBox)


$EventLabel_Size= [System.Windows.Forms.TextRenderer]::MeasureText($EventLabel, $normalfont)

$Counter_Event_Label = New-Object System.Windows.Forms.Label
$Counter_Event_Label.Width = $EventLabel_Size.Width+6  # Apparently despite giving it the string, we need a little extra room.
$Counter_Event_Label.Height= $EventLabel_Size.Height
$Counter_Event_Label.Text = $EventLabel
$Counter_Event_Label.Left = ($Counter_Form.Width/2)-($EventLabel_Size.Width/2)
$Counter_Event_Label.Top = ($Counter_Form.Height/2)-($EventLabel_Size.Height/2)
$Counter_Event_Label.Font = $normalfont

#Setup and handle the OK button
$Counter_OKButton = New-Object System.Windows.Forms.Button
$Counter_OKButton.Width=50
$Counter_OKButton.Height=40
$Counter_OKButton.Text = "Ok"
$Counter_OKButton.Left = 80
$Counter_OKButton.Top = 40
$Counter_OKButton.Add_Click({

    # Get our delay the user entered.
    $delay=$Counter_GetDelay_TextBox.Text

    # Get rid of the controls we don't need any more.
    $Counter_Form.Controls.Remove($Counter_GetDelay_Label)
    $Counter_Form.Controls.Remove($Counter_GetDelay_TextBox)
    $Counter_Form.Controls.Remove($Counter_OKButton)
    $Counter_Form.Controls.Remove($Counter_CancelButton)
    
    # Now add the labels we want.
    $Counter_Form.Controls.Add($Counter_Label)
    $Counter_Form.Controls.Add($Counter_Event_Label)


    while ($delay -gt 0)
    {
        $Counter_Label.Text = "Seconds Remaining: $($delay)"

        $Counter_LabelSize= [System.Windows.Forms.TextRenderer]::MeasureText($Counter_Label.Text , $normalfont) # we need this so we can figure where to put the countdown labeled, centered.
        $Counter_Label.Font = $normalfont
        $Counter_Label.Width = $Counter_LabelSize.Width + 10
        $Counter_Label.Height = 50
        $Counter_Label.Left = ($Counter_Form.Width/2)-($Counter_LabelSize.Width/2)  # We want it centered.
        $Counter_Label.Top = $Counter_Form.Height - 100   # We want it near the bottom of the screen.
    
        if ($delay -le 5)  # Now things are getting close, let's change the color and make it bolder and underline it
        { 
            $Counter_Label.ForeColor = "Red"
            $warningfont = New-Object System.Drawing.Font("Times New Roman",28,[System.Drawing.FontStyle]([System.Drawing.FontStyle]::Bold -bor [System.Drawing.FontStyle]::Underline))
            $Counter_Label.Font = $warningfont
            $Counter_LabelSize= [System.Windows.Forms.TextRenderer]::MeasureText($Counter_Label.Text , $warningfont)
            $Counter_Label.Width = $Counter_LabelSize.Width + 10
            $Counter_Label.Left = ($Counter_Form.Width/2)-($Counter_LabelSize.Width/2)
        } 


        start-sleep 1
        $delay -= 1
    }
    $Counter_Form.Close()


    })
$Counter_Form.Controls.Add($Counter_OKButton)

#Setup and handle the cancel button
$Counter_CancelButton = New-Object System.Windows.Forms.Button
$Counter_CancelButton.Width=50
$Counter_CancelButton.Height=40
$Counter_CancelButton.Text = "Cancel"
$Counter_CancelButton.Left = 140
$Counter_CancelButton.Top = 40
$Counter_CancelButton.Add_Click({$counter_form.Close() })
$Counter_Form.Controls.Add($Counter_CancelButton)

#Setup and handle keyboard Enter/Escape
$Counter_Form.AcceptButton=$Counter_OKButton
$Counter_Form.CancelButton=$Counter_CancelButton

#Finally, we show the dialog


$Counter_Form.ShowDialog() | Out-Null #absorbs cancel message at end. This occurs for reasons outside scope of this article



