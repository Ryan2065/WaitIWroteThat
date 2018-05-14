
try{
    $CompName = 'LKSJDFSDF'
    $WMIPath = "\\" + $CompName + "\root\ccm:SMS_Client"
    $SMSwmi = [wmiclass] $WMIPath
    [Void]$SMSwmi.RepairClient()
    Write-Output 'I was successful!'
}
catch {
    Write-Ouput $_
}

#region EVEN BETTER!!!!!
try{
    $CompName = 'LKSJDFSDF'
    $WMIPath = "\\" + $CompName + "\root\ccm:SMS_Client"
    $SMSwmi = [wmiclass] $WMIPath
    [Void]$SMSwmi.RepairClient()
    Write-Output 'I was successful!'
}
catch [System.Management.Automation.RuntimeException]{
    Set-MMSContentView -Name '03.2-ErrorVariable' -ShowIn 2
}
catch {
    Write-Ouput $_
}
#endregion

