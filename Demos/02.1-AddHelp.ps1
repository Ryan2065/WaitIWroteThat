
Function Write-MMSLog {
    Param(
        [string]$Message,
        [LogBox]$LogBox
    )
    $CurrentTime = (Get-Date).ToLongTimeString()
    $LogBox.Text = $LogBox.Text + "$($CurrentTime) - $LogText `n"
    $LogScrollTo = $LogBox.Text.Length - 250
    $LogBox.Select($LogScrollTo, 0)
    $LogBox.ScrollToCaret()
}

