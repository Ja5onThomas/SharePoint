Add-PSSnapin Microsoft.SharePoint.PowerShell -erroraction SilentlyContinue

#Get All SharePoint Servers - Except DB and SMTP Servers
$Servers = Get-SPServer | Where {$_.Role -ne "Invalid" }

    #Iterate through the list and restart one by one.
    foreach ($server in $servers)  
    {  
       Write-Host "Restarting IIS on server: $($Server.Name)"
       IISRESET $Server.Address
    
       #Optional: Get the Status
       Write-Host "IIS status for server $($server):"  
       IISRESET $server.Address /status
    } 
Write-host "IIS Restarted on All Servers of the Farm!" -f Green