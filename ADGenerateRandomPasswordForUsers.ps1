#This script generates a random password for users taken from a list of users
Import-Module ActiveDirectory

$users = Get-Content C:\scripts\users.txt

foreach ($user in $users) {

    $Password = -join ((33..126) | Get-Random -Count 10 | ForEach-Object { [char]$_ })

    $NewPwd = ConvertTo-SecureString $Password -AsPlainText -Force

    Set-ADAccountPassword $user -NewPassword $NewPwd -Reset

    Write-Host $user, $Password
}
