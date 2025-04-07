#This script checks the status of specified scheduled tasks on specified servers.#

#This section is where the Admin credentials with permissions to create accounts, is set.#
function Get-Credential {}
    param (
$User1 = "testdomain.com\testadminuser"
$PWord = ConvertTo-SecureString -String "thepasswordfortesting" -AsPlainText -Force
$Credential1 = New-Object -TypeName System.Management.Automation.PSCredential -ArgumentList $User1, $PWord

Import-module activedirectory

    #This section grabs the current date to add to the filename#
$today = Get-Date -f "yyyy-MM-dd"

    #This begins the meat of the script#
Get-ScheduledTask -CimSession Test_Server_01 -TaskName "First_Task" | Get-ScheduledTaskInfo | Out-File C:\Users\testadminuser\Desktop\Jobs_Daily_Checklist\Jobs_Daily_Checklist_$today.csv -Credential $Credential1
Get-ScheduledTask -CimSession Test_Server_02 -TaskName "Second_Task" | Get-ScheduledTaskInfo | Out-File -append C:\Users\testadminuser\Desktop\Jobs_Daily_Checklist\Jobs_Daily_Checklist_$today.csv -Credential $Credential1
Get-ScheduledTask -CimSession Test_Server_03 -TaskName "Third_Task" | Get-ScheduledTaskInfo | Out-File -append C:\Users\testadminuser\Desktop\Jobs_Daily_Checklist\Jobs_Daily_Checklist_$today.csv -Credential $Credential1

Pause

