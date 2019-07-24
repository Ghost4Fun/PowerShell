#Simple PS script created by Ghost4Fun on 10.02.2019 requested by L'Oréal Baltic
Import-Module activedirectory #Import AD module 
  
$ADUsers = Import-csv "C:\Temp\Baltics_users.csv" #Get data to import from csv fille  


foreach ($User in $ADUsers)
{
	
		
	$logid =  $User.FirstName + "." + $User.LastName #creates users name from list that  can be recognize by AD
    if ($logid.length -gt 20) {
    $logid1 = $logid.Substring(0, 20) } #If statement with check username. Wheb it is longer than 15 char, it cut it to 15 char(Windows computer name is max 15 char long)

    else {
    $logid1 = $logid

}

$manager = $User.FirstNameManager + "." + $User.LastNameManager #creates users manager name from list that  can be recognize by AD
        if ($manager.length -gt 20) {
    $manager1 = $manager.Substring(0, 20)
   } else {
    $manager1 = $manager
    }

    
    $manaer = (Get-ADUser $manager1).DistinguishedName
	$country = $User.OfficeLocation
    $dywizja = $User.Division
    $atrybut3 = $User.COSTCENTER
    $job = $User.Job
    $description = $country + " " + $dywizja + " " + $job  
    $atrybut3 = $User.COSTCENTER
 
   Set-ADUser -server emea.loreal.intra  -Identity $ziomek1 -division $dywizja -country $country -Manager $manaer -Description $description -Company "L'Oréal Baltic SIA" -Replace @{info="Account verified on 10.02.2019”} -Clear HomeDirectory
    }  #The main script with put whole data into AD


