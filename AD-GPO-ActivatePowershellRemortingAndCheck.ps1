https://www.serveracademy.com/blog/enable-psremoting-with-group-policy/

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
