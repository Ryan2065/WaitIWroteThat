$ErrorActionPreference = 'SilentlyContinue'
$CompName = 'LKSJDFSDF'
$Error.Clear()
$WMIPath = "\\" + $CompName + "\root\ccm:SMS_Client"
$SMSwmi = [wmiclass] $WMIPath
[Void]$SMSwmi.RepairClient()
if ($Error[0]) {
    Write-Output $Error[0]
}
else {
    Write-Output 'I was successful!'
}
