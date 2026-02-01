# Basic Reconnaissance Script – Detailed Explanation

## Purpose
Explains how the basic reconnaissance script performs ethical, non-intrusive information gathering.

---

## Script Breakdown

### `#!/bin/bash`
Specifies that the script should be executed using the Bash shell.

---

### `TARGET=$1`
Stores the first command-line argument as the target domain.

---

### `if [ -z "$TARGET" ]; then`
Checks whether a target domain was provided.

---

### `echo "Usage: $0 <domain>"`
Displays correct usage instructions when no target is supplied.

---

### `exit 1`
Safely exits the script if input validation fails.

---

### `dig "$TARGET" +short`
Retrieves publicly available DNS records for the target domain.

---

### `curl -I "http://$TARGET"`
Fetches HTTP response headers without downloading page content.

---

## Ethical Considerations
- Uses only passive, read-only techniques
- Does not attempt exploitation or scanning
- Suitable for legal reconnaissance phases

---

## One-Sentence Summary
This script performs basic, ethical reconnaissance by collecting DNS records and HTTP headers for a target domain.
