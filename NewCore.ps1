Install-WindowsFeature -Name DNS -IncludeAllSubFeature -IncludeManagementTools
Start-Sleep -s 5
Set-DnsServerForwarder -UseRootHint $false
Get-DnsServerRootHint | Remove-DnsServerRootHint -force
Set-DnsServerForwarder -IPAddress "10.0.0.254" -PassThru
Add-DnsServerQueryResolutionPolicy -Name "BlackholePolicyQType" -Action IGNORE -QType "EQ,ANY" -PassThru | Format-List *
Set-DnsServerResponseRateLimiting -force