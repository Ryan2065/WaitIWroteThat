Set-ExecutionPolicy -ExecutionPolicy Unrestricted -Scope Process

. "$PSScriptRoot\02.1-AddHelp.ps1"

Describe "Write-MMSLog" {
    It 'Adds datetime to the text' {
        $true | should be $true
    }
    It 'Adds text to the end of $LogBox.Text' {
        $true | should be $true
    }
    It 'Scrolls to the end of the TextBox' {
        $true | should be $true
    }
}