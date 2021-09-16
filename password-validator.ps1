#If the parameter is a text file, we get the content if not we actually analize the password
Param
    (
        [string]$f
        
    )

if ($f -match '.txt') {
    
    $password=Get-Content -Path $f

}else {
    
    $password=$f
}


#2 We check the length if has the minimum requirements
# if has, we check the other conditionals(upper/lower/digit)

if ($password.Length -lt 10 ){
    Write-Host "The password must contain at least 10 characters" -ForegroundColor red
    return 1
}else {


    if ($password -cmatch “[A-Z]”) {
        if ($password -cmatch “[0-9]”) {
            if($password -cmatch “[a-z]”){
                Write-Host "Password Passed!!!" -ForegroundColor green
                return 0
            }else {
                Write-Host "The password must contain at least 1 small letter" -ForegroundColor red
                return 1
            }
        }else{
        write-host “The password must contain at least 1 number” -ForegroundColor red
        return 1 
        }
    }
    else {
    write-host “The password must contain at least 1 capital letter” -ForegroundColor red
    return 1
    }
}