$MyCount = 0..2000
$TotalCountPipe = 0
$TotalCountNoPipe = 0


$SBOne = {
    $MyCount | ForEach-Object { 
        $TotalCountPipe = $TotalCountPipe + $PSItem 
    }
}

$SBTwo = {
    foreach($Number in $MyCount) {
        $TotalCountNoPipe = $TotalCountNoPipe + $Number
    }
}



