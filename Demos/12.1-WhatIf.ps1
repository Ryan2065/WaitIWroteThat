function Restart-EVERYTHING2 {
    Param(
        [Parameter(Mandatory=$true)]
        [bool]$IsProduction
    )
    if($IsProduction){
        $Computers = Get-ADComputer
        Foreach($Computer in $Computers){
            Restart-Computer -ComputerName $Computer.Name -Force
        }
    }
    else {
        Write-Verbose -Message "I would have restarted everything!"
    }
}

function Restart-EVERYTHING {
    [CmdletBinding(SupportsShouldProcess=$true)]
    Param(

    )
    $Computers = Get-ADComputer
    Foreach($Computer in $Computers){
        if($PSCmdlet.ShouldProcess("I would have restarted $($Computer.Name)!")){
            Restart-Computer -ComputerName $Computer.Name -Force
        }
    }
}

