#https://www.serveracademy.com/blog/enable-psremoting-with-group-policy/
#create a gpo, link it to domain, and change 3 things in the link below. could be done with a script
New-GPO –Name "xxx" –StarterGpoName "xxx" | New-GPLink –target "dc=Contoso,dc=com" –LinkEnabled yes

# Script to check, activate in domain controller
# Define the target OU
$targetOU = "OU=xxx,DC=xxx,DC=xxx"

#choose all active computers in target OU
$computers = Get-ADComputer -SearchBase $targetOU -Filter {(enabled -eq 'True')}

#loop through all of them
foreach ($computer in $computers) {
    $computerName = $computer.Name
    Test-NetConnection -Port 5985 -ComputerName $computerName
    Test-WSMan -ComputerName $computerName
    Enter-PSSession -ComputerName $computerName
    hostname
}

#refresh GPO on all computers in domain
Get-ADComputer –filter * -Searchbase "cn=computers, dc=Contoso,dc=com" | foreach{ Invoke-GPUpdate –computer $_.name -force}
