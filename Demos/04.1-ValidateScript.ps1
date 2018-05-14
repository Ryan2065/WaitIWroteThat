
Function Write-MMSLog {
    Param(
        [string]$Message,
        [ValidateScript({
            $FullLogFilePath = "$($env:TEMP)\$($PSItem).log"
            if(-not (Test-Path -Path $FullLogFilePath)){
                $null = New-Item $FullLogFilePath
            }
            return $true
        })]
        [string]$LogFile
    )
    $FullLogFilePath = "$($env:TEMP)\$($LogFile).log"
    Out-File -FilePath $FullLogFilePath -InputObject $Message -Append
}
