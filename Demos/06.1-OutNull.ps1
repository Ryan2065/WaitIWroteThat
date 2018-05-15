$MyCount = 0..2000000

Measure-Command {
    foreach($Number in $MyCount) {
        $null = $Number
    }
}

Measure-Command {
    foreach($Number in $MyCount) {
        Out-Null -InputObject $Number
    }
}



