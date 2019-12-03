param([int]$delay=3, [string]$EventLabel = "This is a test")


#Setup initial form
$Counter_Form = New-Object System.Windows.Forms.Form
$Counter_Form.Text = "Countdown Timer!"
$Counter_Form.Width = 450
$Counter_Form.Height = 200
$Counter_Form.WindowState = "Normal"


#Setup our Normal font
$normalfont = New-Object System.Drawing.Font("Times New Roman",14)

#Setup initial label
$Counter_Label = New-Object System.Windows.Forms.Label
$Counter_Label.AutoSize = $true
$Counter_Label.ForeColor = "Green"

$Counter_Label.Font = $normalfont
$Counter_Label.Left = 20
$Counter_Label.Top = 50


#setup input areas

$Counter_GetDelay_Label = New-Object System.Windows.Forms.Label
$Counter_GetDelay_Label.AutoSize = $true
$Counter_GetDelay_Label.Text = "Enter Delay:"
$Counter_GetDelay_Label.Left = 10
$Counter_GetDelay_Label.Top = 8
$Counter_Form.Controls.Add($Counter_GetDelay_Label)


$Counter_GetDelay_TextBox = New-Object System.Windows.Forms.TextBox
$Counter_GetDelay_TextBox.AutoSize = $true 
$Counter_GetDelay_TextBox.Text = $delay
$Counter_GetDelay_TextBox.Left = $Counter_GetDelay_Label.Left + $Counter_GetDelay_Label.Width + 10
$Counter_GetDelay_TextBox.Top = 5
$Counter_Form.Controls.Add($Counter_GetDelay_TextBox)

$Counter_Event_Label = New-Object System.Windows.Forms.Label
$Counter_Event_Label.AutoSize = $true 
$Counter_Event_Label.Text = $EventLabel
$Counter_Event_Label.Location = '20,100' # note we're using a different method to position the text here.
$Counter_Event_Label.Font = $normalfont



#Setup and handle the OK button
$Counter_OKButton = New-Object System.Windows.Forms.Button
$Counter_OKButton.AutoSize = $true 
$Counter_OKButton.Text = "Ok"
$Counter_OKButton.Left = 80
$Counter_OKButton.Top = 40
$Counter_OKButton.Add_Click({
    $delay=$Counter_GetDelay_TextBox.Text

    $Counter_Form.Controls.Remove($Counter_GetDelay_Label)
    $Counter_Form.Controls.Remove($Counter_GetDelay_TextBox)
    $Counter_Form.Controls.Remove($Counter_OKButton)
    $Counter_Form.Controls.Remove($Counter_CancelButton)
    
    $Counter_Form.Controls.Add($Counter_Label)
    $Counter_Form.Controls.Add($Counter_Event_Label)


    while ($delay -gt 0)
    {
        $Counter_Label.Text = "Seconds Remaining: $($delay)"
    
        if ($delay -lt 5)
        { 
            $Counter_Label.ForeColor = "Red"
            $fontsize = 20-$delay
        
            $warningfont = New-Object System.Drawing.Font("Times New Roman",$fontsize,[System.Drawing.FontStyle]([System.Drawing.FontStyle]::Bold -bor [System.Drawing.FontStyle]::Underline))
            $Counter_Label.Font = $warningfont
        } 


        start-sleep 1
        $delay -= 1
    }
    $Counter_Form.Close()


    })
$Counter_Form.Controls.Add($Counter_OKButton)

#Setup and handle the cancel button
$Counter_CancelButton = New-Object System.Windows.Forms.Button
$Counter_CancelButton.AutoSize = $true 
$Counter_CancelButton.Text = "Cancel"
$Counter_CancelButton.Left = $Counter_OKButton.Left + $Counter_OKButton.Width + 10
$Counter_CancelButton.Top = 40
$Counter_CancelButton.Add_Click({$counter_form.Close() })
$Counter_Form.Controls.Add($Counter_CancelButton)

#Setup and handle keyboard Enter/Escape
$Counter_Form.AcceptButton=$Counter_OKButton
$Counter_Form.CancelButton=$Counter_CancelButton

#Finally, we show the dialog
$Counter_Form.ShowDialog() | Out-Null #absorbs cancel message at end. This occurs for reasons outside scope of this article



