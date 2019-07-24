Import-Module activedirectory

$ADUsers = Import-csv "C:\Temp\home.csv"


foreach ($User in $ADUsers)
{


$logid = $User.Nazwauzytkownika

$homeDirectory = '\\fileserver\users\' + $logid.SamAccountName;


   Set-ADUser -server geoportal.gov.pl  -Identity $logid.SamAccountName -HomeDirectory $homeDirectory
    }
