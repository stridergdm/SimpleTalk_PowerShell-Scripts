$delay = 10

$Counter_Form = New-Object System.Windows.Forms.Form
$Counter_Form.Text = "Countdown Timer!"
$Counter_Form.Width = 450
$Counter_Form.Height = 200

$Counter_Label = New-Object System.Windows.Forms.Label
$Counter_Label.AutoSize = $true 

$Counter_Form.Controls.Add($Counter_Label)

while ($delay -ge 0)
{
    $Counter_Form.Show()
    $Counter_Label.Text = "Seconds Remaining: $($delay)"

    start-sleep 1
    $delay -= 1
}
$Counter_Form.Close()