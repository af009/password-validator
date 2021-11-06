## Password Validator

## Main branch:

We create a password validator script that check the strenght with the following requirements:


1. Length – minimum of 10 characters.
2. Contain both alphabet and number.
3. Include both the small and capital case letters.
4. Color the output (as seen in expected result) green if it passed the validation and red if it didn’t.
5. Return exit code 0 if it passed the validation and exit code 1 if it didn’t.
6. If a validation failed provide a message explaining why

```
./password-validator.sh "MyP@ssw0rd!"
```

## Feature branch:

We add capability to the previous script: 
If the option “-f” is added the password should be retrieved from a file:

```
./password-validator.sh -f "/mypath/password.txt"

```

## Powershell branch:

We create the same script (includes the feature) but this time using powershell


## Bonus branch:


1. We create a powershell script that open “notepad” with the content “Hello Bootcamp!”
1. We create a powershell script with the following logic:

- Create a “windows task” that must execute the script (created on #3) periodically according to the time (passed as a parameter)
- Wait X seconds (received as parameter)
- Disable the task in the windows task scheduler (to avoid it’s execution)
- Get all task’s full names and create a clean output with the task names

```
.\Task-Generator.ps1 -TaskName "MyName" -TriggerSeconds “60” -WaitSeconds "120”

```

