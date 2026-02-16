🛠 Installation & Deployment Guide
This document provides a detailed, step-by-step guide to reproducing the Wazuh SIEM & SOC Automation Lab environment.

📋 Prerequisites
Before starting, ensure you have the following ready:

Wazuh Manager Host: Ubuntu 22.04 LTS (with Docker and Docker Compose installed).

Endpoints: Windows 10/11 Professional and a secondary Ubuntu Server.

Network: All machines must have network connectivity to the Manager IP.

🏗 Step 1: Deploying the Wazuh Manager
We use Docker Compose for a fast and scalable deployment of the Wazuh stack (Manager, Indexer, and Dashboard).

Clone this repository to your Ubuntu Manager.

Navigate to the root directory and run:

Bash
docker-compose up -d
Access the Wazuh Dashboard via your browser: https://<YOUR_MANAGER_IP> (Default credentials: admin / SecretPassword).

🛡 Step 2: Configuring Custom Detection Rules
To detect the specific threats mentioned in this lab (Brute-force, etc.), apply the custom rules:

Copy the contents of configs/custom-rules.xml from this repo.

On the Wazuh Dashboard, go to Management > Rules > Custom Rules.

Edit the local_rules.xml file, paste the custom rules, and save.

Restart the Wazuh Manager to apply changes.

💻 Step 3: Endpoint Agent Deployment
Windows Endpoints (with Sysmon)
Install Sysmon: Download Sysmon from Microsoft and install it using a security-focused config (like SwiftOnSecurity).

Install Wazuh Agent: Download the MSI installer and run it.

Configure Connection:

Edit C:\Program Files (x86)\ossec-agent\ossec.conf.

Update the <address> tag with your Manager IP.

Firewall Fix: Run the provided PowerShell script to ensure the agent can communicate:

PowerShell
.\scripts\fix-firewall.ps1
Restart the Wazuh service.

Ubuntu Endpoints
Install the agent using the official Wazuh repository commands.

Update the /var/ossec/etc/ossec.conf with the Manager IP.

Start the agent: sudo systemctl start wazuh-agent.

✅ Step 4: Verification & Testing
Once everything is connected, verify the setup:

Dashboard Check: Navigate to the Agents tab on the Wazuh Dashboard. You should see all endpoints with an "Active" status.

Brute-Force Test: Attempt multiple failed SSH or RDP logins to trigger the 100001 custom rule.

Log Review: Check the Security Events tab to see real-time alerts popping up!

🆘 Troubleshooting
Agent Status "Never Connected": Double-check that ports 1514/1515 are open on the Manager's firewall and that the ossec.conf IP is correct.

No Sysmon Logs: Ensure the Sysmon service is running and the ossec.conf on the Windows agent has the correct localfile path for the Sysmon event channel.
