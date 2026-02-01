# SSH Failed Login Detection – Detailed Explanation

## Purpose
This document explains how the SSH failed login detection script works, line by line.
It is intended for interview preparation and technical review.

---

## Script Breakdown

### `#!/bin/bash`
Tells the operating system to execute this script using the Bash shell.

---

### `LOG="/var/log/auth.log"`
Defines the location of the SSH authentication log file.

---

### `THRESHOLD=5`
Sets the number of failed login attempts required before triggering an alert.

---

### `echo "=== SSH FAILED LOGIN DETECTION ==="`
Prints a clear title to identify the script output.

---

### `date`
Outputs the current date and time for SOC timeline correlation.

---

### `grep "Failed password" "$LOG"`
Searches the authentication log for failed SSH login attempts.

---

### `awk '{print $(NF-3)}'`
Extracts the source IP address from each failed login entry.
`NF` represents the number of fields in the log line.

---

### `sort | uniq -c | sort -nr`
- Groups identical IP addresses  
- Counts how many times each IP appears  
- Sorts results from highest to lowest count  

This highlights possible brute-force activity.

---

### `while read count ip; do`
Iterates through each IP address and its failure count.

---

### `if [ "$count" -ge "$THRESHOLD" ]; then`
Checks whether the number of failed attempts meets or exceeds the threshold.

---

### `echo "[ALERT] Potential brute-force from IP: $ip ($count attempts)"`
Prints a security alert when suspicious activity is detected.

---

### `done`
Ends the loop.

---

## One-Sentence Summary
This script scans SSH authentication logs and alerts when an IP address exceeds a defined number of failed login attempts, indicating a possible brute-force attack.

---
