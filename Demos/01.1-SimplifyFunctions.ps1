
$CurrentDate = Get-Date
$CurrentTime = $CurrentDate.ToLongTimeString()
$LogText = "$CurrentTime - Successfully Added $CompName"
$LogBox.Text = $LogBox.Text + $LogText + "`n"
$LogScrollTo = $LogBox.Text.Length - 250
$LogBox.Select($LogScrollTo, 0)
$LogBox.ScrollToCaret()

