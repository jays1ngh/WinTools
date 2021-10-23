#Get free space on the SystemDrive directory
$FreeSpaceBeforeCleanUp = (Get-WmiObject -Class Win32_logicaldisk -Filter "DeviceID = '$env:SystemDrive'" | Select -ExpandProperty FreeSpace)/1GB
Write-Host System Drive has $FreeSpaceBeforeCleanUp GB Free Space

#Analyse the size of component store (WinSxS folder)
#Dism.exe /Online /Cleanup-Image /AnalyzeComponentStore

#StartComponentCleanup to compress components
#Dism.exe /online /Cleanup-Image /StartComponentCleanup

#Remove superseded versions of every component
Dism.exe /online /Cleanup-Image /StartComponentCleanup /ResetBase

$FreeSpaceAfterCleanUp = (Get-WmiObject -Class Win32_logicaldisk -Filter "DeviceID = '$env:SystemDrive'" | Select -ExpandProperty FreeSpace)/1GB
Write-Host System Drive has $FreeSpaceAfterCleanUp GB Free Space
