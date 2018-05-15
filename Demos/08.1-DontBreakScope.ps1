#region Not Clear
$Script:MyHorribleIdea = 'Breaking scope!'

Function New-Scope {
    Write-Output $Script:MyHorribleIdea
}
Clear-Host
$MyHorribleIdea
New-Scope
#endregion

#region WTF?!
$Script:MyHorribleIdea = 'Breaking scope!'

Function New-Scope2 {
    $MyHorribleIdea = 'In Scope'
    Write-Output $MyHorribleIdea
}
Clear-Host
$MyHorribleIdea
New-Scope2
$MyHorribleIdea
#endregion
