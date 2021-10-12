I would like to create a Powershell tool to clean up space on the end users devices along with some logging mechanism to see the outcome for reporting and troubleshooting purposes. I will be updating this document on the go along aligned with my research and findings online.

Main goal is to clear storage in the following locations without impacting the users data:
*******************************
Will be updating this area soon
*******************************

## Analyse the size of component store (WinSxS folder)
Dism.exe /Online /Cleanup-Image /AnalyzeComponentStore

Above command returned the following result:
********************************************
Deployment Image Servicing and Management tool
Version: 10.0.19041.844

Image Version: 10.0.19042.1165

[==========================100.0%==========================]

Component Store (WinSxS) information:

Windows Explorer Reported Size of Component Store : 10.27 GB

Actual Size of Component Store : 9.93 GB

    Shared with Windows : 5.23 GB
    Backups and Disabled Features : 4.69 GB
    Cache and Temporary Data :  0 bytes

Date of Last Cleanup : 2021-10-07 11:46:32

Number of Reclaimable Packages : 0
Component Store Cleanup Recommended : No

The operation completed successfully.
********************************************






## Remove superseded versions of every component
Dism.exe /online /Cleanup-Image /StartComponentCleanup /ResetBase

Above command resturned the following results and this cleared nearly 3GB worth of data
********************************************

Deployment Image Servicing and Management tool
Version: 10.0.19041.844

Image Version: 10.0.19042.1165

[==========================100.0%==========================]

Component Store (WinSxS) information:

Windows Explorer Reported Size of Component Store : 6.61 GB

Actual Size of Component Store : 6.54 GB

    Shared with Windows : 5.20 GB
    Backups and Disabled Features : 1.33 GB
    Cache and Temporary Data :  0 bytes

Date of Last Cleanup : 2021-10-12 19:57:57

Number of Reclaimable Packages : 0
Component Store Cleanup Recommended : No

The operation completed successfully.
********************************************

## Further read
https://www.jaapbrasser.com/diskcleanup-remove-previous-windows-versions-powershell-module/
