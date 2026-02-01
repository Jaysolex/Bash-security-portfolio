#!/bin/bash

TARGET=$1

if [ -z "$TARGET" ]; then
    echo "Usage: $0 <domain>"
    exit 1
fi

echo "=== BASIC RECON REPORT ==="
date
echo

echo "[+] Target:"
echo "$TARGET"
echo

echo "[+] DNS Records:"
dig "$TARGET" +short
echo

echo "[+] HTTP Headers:"
curl -I "http://$TARGET" 2>/dev/null
