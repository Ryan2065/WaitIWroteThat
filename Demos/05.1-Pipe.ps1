$MyCount = 0..2
$TotalCountPipe = 0
$TotalCountNoPipe = 0


Measure-Command {
    $MyCount | ForEach-Object { 
        $TotalCountPipe = $TotalCountPipe + $PSItem 
    }
}

Measure-Command {
    foreach($Number in $MyCount) {
        $TotalCountNoPipe = $TotalCountNoPipe + $Number
    }
}



