Register-EditorCommand `
    -Name 'Demo.OpenDemo1' `
    -DisplayName 'Demo 1: SimplifyCodeWithFunctions' `
    -ScriptBlock {
        param([Microsoft.PowerShell.EditorServices.Extensions.EditorContext]$context)
        Open-EditorFile "$PSScriptRoot\Demo1.OpenPowerPoint.ps1"
    }

    Register-EditorCommand `
    -Name 'Demo.MeasureScript' `
    -DisplayName 'Measure Script Performance' `
    -ScriptBlock {
        param([Microsoft.PowerShell.EditorServices.Extensions.EditorContext]$context)
        $CurrentFilePath = $context.CurrentFile.Path
        $FileName = (Get-Item $CurrentFilePath).Name
        Switch($FileName) {
            
        }
    }