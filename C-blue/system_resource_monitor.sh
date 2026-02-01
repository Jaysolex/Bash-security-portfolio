#!/bin/bash

echo "=== SYSTEM RESOURCE MONITOR ==="
date
echo

echo "[+] Top CPU-consuming processes:"
ps aux --sort=-%cpu | head -n 6
echo

echo "[+] Top memory-consuming processes:"
ps aux --sort=-%mem | head -n 6
