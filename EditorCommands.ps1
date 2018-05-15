
if($null -eq $Global:MMSContentView) {
    $Global:MMSContentView = New-VSCodeHtmlContentView -Title 'MMS Content' -ShowInColumn One
}
function Set-MMSContentView ([string]$Name, [int]$ShowIn) {
    $DidntCreate = $true
    if($null -eq $Global:MMSContentView) {
        $Global:MMSContentView = New-VSCodeHtmlContentView -Title 'MMS Content' -ShowInColumn $ShowIn
        Start-Sleep -Milliseconds 500
        $DidntCreate = $false
    }
    $ScriptPath = 'C:\Users\Ryan\Desktop\WaitIWroteThat\Demos'
    $Content = ('<img src="{0}\{1}.jpeg" alt="{1}">' -f $ScriptPath,$Name )
    $null = Set-VSCodeHtmlContentView -HtmlContentView $Global:MMSContentView -HtmlBodyContent $Content
    if($DidntCreate){
        $Global:MMSContentView.Show($ShowIn)`
    }
}

Function Measure-MMSCommand {
    Param(
        [scriptblock]$ScriptBlock1,
        [scriptblock]$ScriptBlock2,
        [string]$DemoName
    )
    $Results1 = Measure-Command -Expression $ScriptBlock1
    $Results1
    $Results2 = Measure-Command -Expression $ScriptBlock2
    $Results2
    
}


Function Get-ADComputer {
    Class MMSADComputer {
        [string]$Name
        MMSADComputer(){
            $this.Name = 'COMP' + (Get-Random -Minimum 10000 -Maximum 99999)
        }
    }
    $count = 0
    while($count -lt 10932){
        $count++
        [MMSADComputer]::new()
    }
}