# Run as Administrator
# Solution for "Agent connection refused" challenge

Write-Host "Configuring Firewall for Wazuh Agent..." -ForegroundColor Cyan

# Allow Wazuh Manager communication ports
netsh advfirewall firewall add rule name="Wazuh Agent TCP-In" dir=in action=allow protocol=TCP localport=1514,1515
netsh advfirewall firewall add rule name="Wazuh Agent TCP-Out" dir=out action=allow protocol=TCP localport=1514,1515

Write-Host "Firewall rules updated successfully." -ForegroundColor Green
