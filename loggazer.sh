#!/bin/bash

LOG_FILE="logs/sample_auth.log"
REPORT_FILE="reports/failed_logins_report.txt"

mkdir -p reports
echo "FAILED LOGIN ATTEMPTS REPORT - $(date)" > "$REPORT_FILE"
echo "----------------------------------------" >> "$REPORT_FILE"

grep "Failed password" "$LOG_FILE" | while read -r line; do
    TIMESTAMP=$(echo "$line" | awk '{print $1, $2, $3}')
    USER=$(echo "$line" | grep -oP "for (invalid user )?\K\S+(?= from)")
    IP=$(echo "$line" | grep -oP "from \K[\d.]+")
    echo "$TIMESTAMP | User: $USER | IP: $IP" >> "$REPORT_FILE"
done

echo "[+] Report saved to $REPORT_FILE"
echo -e "\nTOP BRUTE-FORCE IPs (3 or more failures):" >> "$REPORT_FILE"
echo "------------------------------------------" >> "$REPORT_FILE"

grep "Failed password" "$LOG_FILE" | grep -oP "from \K[\d.]+" | sort | uniq -c | sort -nr | awk '$1 >= 3' | while read -r count ip; do
    echo "$ip attempted $count failed logins" >> "$REPORT_FILE"
done
