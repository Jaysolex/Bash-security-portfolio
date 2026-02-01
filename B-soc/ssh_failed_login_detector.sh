#!/bin/bash

LOG="/var/log/auth.log"
THRESHOLD=5

echo "=== SSH FAILED LOGIN DETECTION ==="
date
echo

echo "[+] Checking for repeated failed SSH logins..."

grep "Failed password" "$LOG" \
| awk '{print $(NF-3)}' \
| sort | uniq -c | sort -nr \
| while read count ip; do
    if [ "$count" -ge "$THRESHOLD" ]; then
        echo "[ALERT] Potential brute-force from IP: $ip ($count attempts)"
    fi
done

