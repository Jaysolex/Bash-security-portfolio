# SSH Failed Login Detection Script

## Purpose
Detects repeated failed SSH login attempts indicative of brute-force attacks.

## SOC Use Case
Used by SOC analysts to identify unauthorized access attempts against Linux servers.

## Detection Logic
- Parses /var/log/auth.log
- Extracts source IPs from failed login events
- Triggers alerts when attempts exceed threshold

## Threshold
- Default: 5 failed attempts

## Screenshot Evidence
- screenshots/07-ssh-failed-login-detection.png

## MITRE ATT&CK Mapping
- T1110 – Brute Force
