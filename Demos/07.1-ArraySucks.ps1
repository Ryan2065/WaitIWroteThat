$MyCount = 0..200000
$Array = @()
$ArrayList = New-Object System.Collections.ArrayList

Measure-Command {
    foreach($Number in $MyCount) {
        $null = $ArrayList.Add($Number)
    }
}


Measure-Command {
    foreach($Number in $MyCount) {
        $Array += $Number
    }
}
