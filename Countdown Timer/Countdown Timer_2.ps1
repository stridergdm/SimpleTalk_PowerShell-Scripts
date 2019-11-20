$delay = 10

$Counter_Form = New-Object System.Windows.Forms.Form
$Counter_Form.Text = "Countdown Timer!"
$Counter_Form.Width = 450
$Counter_Form.Height = 200

$Counter_Label = New-Object System.Windows.Forms.Label
$Counter_Label.Width = 300
$Counter_Label.Height = 30
$Counter_Label.ForeColor = "Green"

$normalfont = New-Object System.Drawing.Font("Times New Roman",14)
$Counter_Label.Font = $normalfont
$Counter_Label.Left = 20
$Counter_Label.Top = 20

$Counter_Form.Controls.Add($Counter_Label)

while ($delay -ge 0)
{
    $Counter_Form.Show()
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