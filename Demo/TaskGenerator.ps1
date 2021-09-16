
Param
        (
            [string]$TaskName,
            [int]$TriggerSeconds,
            [int]$WaitSeconds    
        )


# We create/register a new task(action), we execute the task after the trigger time,
# we wait (-waitseconds) to disable the task and finally we show all the taskname
  
function GenerateTask{

    $Action = New-ScheduledTaskAction -Execute "PowerShell.exe" -Argument 'C:\Demo\HelloScript.ps1'

    Register-ScheduledTask -Action $Action -TaskName $TaskName

    Start-Sleep -s $TriggerSeconds

    Start-ScheduledTask -TaskName $TaskName

    Start-Sleep -s $WaitSeconds

    Disable-ScheduledTask -TaskName $TaskName

    Get-ScheduledTask -TaskPath \ 

}


#Infinite loop, we break it if our task state change to disabled

while (1 -eq 1){

    GenerateTask -TaskName $TaskName -TriggerSeconds $TriggerSeconds -WaitSeconds $WaitSeconds

    if(Get-ScheduledTask -TaskName $TaskName | ? State -eq disabled) {break};
    
}
