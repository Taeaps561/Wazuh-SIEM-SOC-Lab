🔍 Troubleshooting Guide
This guide covers common issues encountered during the deployment of the Wazuh SIEM & SOC Automation Lab, specifically focusing on connectivity and log visibility.

🛰️ 1. Agent Connectivity Issues
The most common challenge is when an agent shows as "Never Connected" or reports a "Connection Refused" error.

Symptoms
Agent status remains "Never Connected" in the Wazuh Dashboard.

Error logs in C:\Program Files (x86)\ossec-agent\ossec.log show connection timeouts.

Root Cause Analysis (RCA)
Incorrect Manager IP: The agent is trying to talk to a placeholder IP or an incorrect gateway.

Firewall Obstruction: Inbound/Outbound rules on either the Windows endpoint or the Ubuntu server are blocking ports 1514 (Agent communication) or 1515 (Registration).

Resolution Steps
Verify ossec.conf: Ensure the <address> tag in the agent configuration points directly to your Wazuh Manager's IP.

Automated Firewall Fix: Run the provided PowerShell script on the Windows endpoint to open the necessary ports:

PowerShell
.\scripts\fix-firewall.ps1
Check Server-Side Ports: On the Ubuntu Manager, ensure the Docker containers are exposing ports correctly and that ufw or iptables allows traffic on 1514/1515.

📜 2. Missing Sysmon Logs
Sometimes the agent is connected, but advanced telemetry like process creation or network connections is not visible.

Symptoms
Basic Windows Event logs are visible, but no Sysmon-specific events (Event ID 1, 3, etc.) appear.

Resolution Steps
Check Sysmon Service: Verify that Sysmon is installed and running on the endpoint (Get-Service -Name "Sysmon").

Event Channel Path: Ensure the ossec.conf on the agent includes the correct channel location:

XML
<localfile>
  <location>Microsoft-Windows-Sysmon/Operational</location>
  <log_format>eventchannel</log_format>
</localfile>
⚡ 3. Custom Rules Not Triggering
You perform a brute-force test, but no alerts appear on the dashboard.

Resolution Steps
Rule ID Check: Verify that your custom rule ID is unique and falls within the 100,000+ range.

Wazuh-Logtest: Use the built-in wazuh-logtest utility on the manager to paste a sample log and see if it matches your custom rule logic.

Restart Manager: Remember that any changes to /var/ossec/etc/rules/local_rules.xml require a restart of the Wazuh Manager service/container.

Tip: Always check the Wazuh Agent log (ossec.log) as your first point of reference. It usually tells you exactly why the connection is failing or which configuration line has a syntax error.

Would you like me to help you draft a Conclusion or an About Me section to wrap up your documentation?
