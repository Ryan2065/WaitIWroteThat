$MyCSV = Import-Csv -Path 'c:\MySuperImportCSV.csv'

#region old way
$MyTableString = @'
Insert Into MyMMSTable(
    Number
)
Values(

'@

Foreach($Row in $MyCSV){
    $MyTableString += "$($Number),"
}
$MyTableString = $MyTableString + ")"

Invoke-SQLQuery -Query $MyTableString
#endregion

#region GoodWay
$MyDataTable = Out-DbaDataTable -InputObject $MyCSV
Write-DbaDataTable -InputObject $MyDataTable
#endregion
