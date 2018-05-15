$MyCount = 0..20000
$TotalCountPipe = 0
$TotalCountNoPipe = 0


(Measure-Command {
    $MyCount | ForEach-Object { 
        $TotalCountPipe = $TotalCountPipe + $PSItem 
    }
}).Milliseconds

(Measure-Command {
    foreach($Number in $MyCount) {
        $TotalCountNoPipe = $TotalCountNoPipe + $Number
    }
}).Milliseconds
