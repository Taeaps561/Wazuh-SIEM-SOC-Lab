# Wazuh SIEM & SOC Automation Lab 🛡️

## 📝 Overview
This project demonstrates the deployment and configuration of a **Wazuh SIEM** environment to monitor and secure endpoints. The lab focuses on threat detection, log management, and real-time alerting for a hybrid infrastructure (Windows & Linux).

## 🏗️ Architecture
- **SIEM Manager:** Wazuh Server (Ubuntu/Docker)
- **Endpoints:** Windows 10/11, Ubuntu Server
- **Monitoring Tools:** Sysmon, Windows Event Logs, Wazuh Ruleset

## 📁 Project Structure
The repository is organized as follows to ensure easy deployment and configuration:

```text
├── configs/
│   ├── custom-rules.xml      # Custom XML detection rules for the Wazuh Manager
│   └── ossec.conf            # Sample agent configuration with Sysmon integration
├── scripts/
│   └── fix-firewall.ps1      # PowerShell script to automate agent-to-manager connectivity
├── docker-compose.yml        # Orchestration file to deploy the Wazuh SIEM stack
└── README.md                 # Project documentation and overview
```

## 🚀 Key Features Implemented
- **Endpoint Security Monitoring:** Integrated Wazuh agents with Windows endpoints.
- **Threat Detection:** Configured custom rules to detect brute-force attacks and unauthorized access.
- **Log Analysis:** Centralized logging from multiple sources for visibility.
- **Vulnerability Assessment:** Automated scanning of endpoint vulnerabilities.

## 🛠️ Configurations & Implementation
- **Custom Rules:** Located in `/configs/custom-rules.xml` to detect specific suspicious activities.
- **Sysmon Integration:** Enhanced Windows logging using Sysmon for deeper visibility into process creation and network connections.

## 🚧 Challenges & Solutions
- **Challenge:** Encountered "Agent connection refused" on Windows endpoints during initial setup.
- **Solution:** Identified firewall blockage and incorrect Manager IP configuration. Resolved by updating `ossec.conf` and adjusting inbound rules on the server.

## 📊 Visuals
![Wazuh Dashboard](docs/dashboard-screenshot.png)
*Example of the Wazuh dashboard detecting real-time alerts.*

*Created by IAM66 - Aiming for Excellence in Cloud Security*
