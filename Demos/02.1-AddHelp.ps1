
Function Write-MMSLog {
    <#
    .SYNOPSIS
    Will write to the LogBox
    
    .DESCRIPTION
    Will append text to the end of the log box and scroll to the bottom
    
    .PARAMETER Message
    String parameter - want the message to send to the log box
    
    .PARAMETER LogBox
    TextBox from the UI
    
    .EXAMPLE
    An example
    
    .NOTES
    General notes
    #>
    Param(
        [string]$Message,
        [LogBox]$LogBox
    )
    $CurrentTime = (Get-Date).ToLongTimeString()
    $LogBox.Text = $LogBox.Text + "$($CurrentTime) - $Message `n"
    $LogScrollTo = $LogBox.Text.Length - 250
    $LogBox.Select($LogScrollTo, 0)
    $LogBox.ScrollToCaret()
}

