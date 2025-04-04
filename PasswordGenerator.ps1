﻿$PasswordLength = '16'
$SpecialL = '2'
$NumbersL = '4'
$CapitalL = ($PasswordLength - $SpecialL - $NumbersL) / 2
$LowerL = $CapitalL

function Get-RandomCharacters($length, $characters) {
    $random = 1..$length | ForEach-Object { Get-Random -Maximum $characters.length }
    $private:ofs=""
    return [String]$characters[$random]
}
 
function Scramble-String([string]$inputString){     
    $characterArray = $inputString.ToCharArray()   
    $scrambledStringArray = $characterArray | Get-Random -Count $characterArray.Length     
    $outputString = -join $scrambledStringArray
    return $outputString 
}


$password = Get-RandomCharacters -length $LowerL -characters 'abcdefghiklmnoprstuvwxyz'
$password += Get-RandomCharacters -length $CapitalL -characters 'ABCDEFGHKLMNOPRSTUVWXYZ'
$password += Get-RandomCharacters -length $NumbersL -characters '1234567890'
$password += Get-RandomCharacters -length $SpecialL -characters '!"§$%&/()=?}][{@#*+'
$password = Scramble-String $password
Write-Host "Password: $Password"











