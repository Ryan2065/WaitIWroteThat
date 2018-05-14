using namespace Microsoft.PowerShell.EditorServices.Protocol.MessageProtocol
using namespace Microsoft.PowerShell.EditorServices.Protocol.Messages
using namespace Microsoft.PowerShell.EditorServices


function ReadInputPrompt
{
    param([string]$Prompt)
    end
    {
        $result = $psEditor.Components.Get([IMessageSender]).SendRequest([ShowInputPromptRequest]::Type,[ShowInputPromptRequest]@{
            Name  = $Prompt
            Label = $Prompt
        },$true).Result

        if (-not $result.PromptCanceled)
        {
            $result.ResponseText
        }
    }
}
function ReadChoicePrompt
{
    param([string]$Prompt, [System.Management.Automation.Host.ChoiceDescription[]]$Choices)
    end
    {
        $choiceIndex = 0
        $convertedChoices = $Choices.ForEach{
            $newLabel = '{0} - {1}' -f ($choiceIndex + 1), $_.Label
            [ChoiceDetails]::new($newLabel, $_.HelpMessage)
            $choiceIndex++
        } -as [ChoiceDetails[]]

        $result = $psEditor.Components.Get([IMessageSender]).SendRequest([ShowChoicePromptRequest]::Type,[ShowChoicePromptRequest]@{
                Caption        = $Prompt
                Message        = $Prompt
                Choices        = $convertedChoices
                DefaultChoices = 0
            },$true).Result

        if (-not $result.PromptCanceled)
        {
            $result.ResponseText | Select-String '^(\d+) - ' | ForEach-Object { $_.Matches.Groups[1].Value - 1 }
        }
    }
}
<#
Register-EditorCommand `
    -Name 'Demo.OpenDemo' `
    -DisplayName 'Open Demos' `
    -ScriptBlock {
        param([Microsoft.PowerShell.EditorServices.Extensions.EditorContext]$context)
        $List = "01","02","03","04","05","06","07","08",'09','10'
        $Choices = [System.Management.Automation.Host.ChoiceDescription[]] @($List)

        $Selection = ReadChoicePrompt -Prompt "Pl`ease Select a Demo" -Choices $Choices
        $Files = Get-ChildItem -Path 'C:\Users\Ryan\Desktop\WaitIWroteThat\Demos' -Filter "*$($Selection).*.ps1"
        foreach($file in $files){
            Open-EditorFile -Path $file.fullName
        }
    }#>

    Register-EditorCommand `
    -Name 'Demo.MeasureScript' `
    -DisplayName 'Measure Script Performance' `
    -ScriptBlock {
        param([Microsoft.PowerShell.EditorServices.Extensions.EditorContext]$context)
        $CurrentFilePath = $context.CurrentFile.Path
        $FileName = (Get-Item $CurrentFilePath).Name
        <#Switch($FileName) {
            
        }#>
    }
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
        $Global:MMSContentView.Show($ShowIn)
    }
}