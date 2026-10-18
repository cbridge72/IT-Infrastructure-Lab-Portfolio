
# Active Directory Health Report
# Portfolio example based on Lab 25
# Run on a Windows Server domain controller with administrative privileges.
# Performs read-only checks and saves a report.

$ReportPath = Join-Path $env:TEMP "AD-HealthReport.txt"

"Active Directory Health Report" | Set-Content $ReportPath
"Computer: $env:COMPUTERNAME" | Add-Content $ReportPath
"Date: $(Get-Date)" | Add-Content $ReportPath

# Check essential domain controller services
"`n=== Essential Services ===" | Add-Content $ReportPath

Get-Service -Name NTDS, DNS, Netlogon |
    Select-Object Name, Status, StartType |
    Out-String |
    Add-Content $ReportPath

# Run domain controller diagnostics
"`n=== Domain Controller Diagnostics ===" | Add-Content $ReportPath

dcdiag /test:Advertising /test:DNS 2>&1 |
    Out-String |
    Add-Content $ReportPath

# Verify Active Directory DNS records
"`n=== DNS SRV Records ===" | Add-Content $ReportPath

try {
    Import-Module ActiveDirectory -ErrorAction Stop
    $DomainName = (Get-ADDomain -ErrorAction Stop).DNSRoot

    Resolve-DnsName -Name "_ldap._tcp.dc._msdcs.$DomainName" `
        -Type SRV -ErrorAction Stop |
        Select-Object Name, NameTarget, Port |
        Out-String |
        Add-Content $ReportPath
}
catch {
    "DNS lookup failed: $($_.Exception.Message)" |
        Add-Content $ReportPath
}

Write-Host "Health report saved to: $ReportPath"
