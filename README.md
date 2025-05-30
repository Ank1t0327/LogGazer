# LogGazer
A lightweight Bash-based log analyzer to detect failed login attempts and brute-force IPs


## Features

- Parses Linux auth logs to find failed login attempts
- Counts the number of failed attempts per IP address
- Generates a report listing suspicious IPs with high failure counts
- Fully written in Bash, lightweight and easy to use

## Installation

Clone the repository or download the files directly.

->bash
git clone https://github.com/Ank1t0327/LogGazer.git
cd LogGazer



![image](https://github.com/user-attachments/assets/b48394d5-b555-458d-a82f-348e3befeae8)



Usage
Make the main script executable:
chmod +x loggazer.sh


Run the script with your log file:
./loggazer.sh logs/sample_auth.log
The report will be generated in the reports/ directory.


Example Output
Suspicious IPs with failed login attempts:
192.168.1.10: 15 attempts
10.0.0.5: 8 attempts




![image](https://github.com/user-attachments/assets/ee751287-107f-4046-b4d1-4d17383e4e24)




~Created by Ankit.
