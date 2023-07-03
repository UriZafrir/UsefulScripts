# Set the email parameters
$SMTPServer = "xxx.xxx.xxx.xxx"
$FromEmail = "noreply@xxxxxx.co.il"
$LogFilePath = "C:\email-password-expiry-link\log.txt"
$Subject = "Password Expiry Reminder"
$BodyTemplate = @"
Dear {0},

This is a reminder that your password for xxxxx will expire in {1} days on {2}. Please make sure to change your password before it expires with this link

Regards,
Your IT Team
"@

# Set the days before expiry to send the reminders
$DaysBeforeExpiry = 7, 5, 3, 1

# Set the user properties
Set-Culture -CultureInfo en-GB
$pe = 'msDS-UserPasswordExpiryTimeComputed'
$users = Get-ADUser -Properties $pe, mail -Filter {Enabled -eq $True -and PasswordNeverExpires -eq $False} |
    Select-Object SamAccountName, Name, mail, @{
        l = 'PassExpireDate'
        e = {[datetime]::FromFileTime($_."$pe")}
    } |
    Where-Object { $_.PassExpireDate -gt (Get-Date) } |
    Select-Object SamAccountName, Name, mail, PassExpireDate, @{
        l = 'days'
        e = {($_.PassExpireDate - (Get-Date)).Days}
    } |
    Sort-Object days
    

# Send reminders to the users

foreach ($user in $users) {
    try {
        foreach ($days in $DaysBeforeExpiry) {
            if ($user.days -eq $days) {
                $ToEmail = $user.mail
                $Body = $BodyTemplate -f $user.Name, $user.days, $user.PassExpireDate.ToString("yyyy-MM-dd")

                # Send the email
                Send-MailMessage -SmtpServer $SMTPServer -From $FromEmail -To $ToEmail -Subject $Subject -Body $Body
                #$ToEmail

                # Log the email
                $logMessage = "Email sent to: $ToEmail on $(Get-Date)"
                Add-content -Path $LogFilePath -Value $logMessage

                break
            }
        }
    } catch {
        $subj = "Password Reset Script Error On User: $($user.Name)"
        $msg = "There was an error sending the password reset for the user: $($user.Name)`n The Error: $($_.Exception.Message)"
        Send-MailMessage -SmtpServer $SMTPServer -From $FromEmail -To "host@matrix.co.il" -Subject $subj -Body $msg

        # Log the error
        $logMessage = "Error sending email to: $ToEmail on $(Get-Date)`nError Message: $($_.Exception.Message)"
        Add-content -Path $LogFilePath -Value $logMessage

        continue
    }
}
