# inventory
This script is designed to collect and report on the inventory of computer hardware and software installed on a network of computers. The script is written in Bash and is intended to be run on a Linux or macOS system.
Script Name: inventory_script.sh

Purpose: This script is designed to collect and report on the inventory of computer hardware and software installed on a network of computers. The script is written in Bash and is intended to be run on a Linux or macOS system.

Functionality:

Hardware Information: The script collects information about the computer hardware, including:
Model
CPU
RAM
Disk size
Network card
Graphics card
Software Information: The script collects information about the software installed on the computer, including:
Operating System
Installed applications
User Information: The script collects information about the users on the computer, including:
User name
Full name
Output:

The script generates a CSV file named inventory_report.csv that contains the collected information in the following format:



Hardware,Software,User
Model, CPU, RAM, Disk Size, Network Card, Graphics Card, Operating System, Installed Apps, User Name
How to Use:

Save the script to a file named inventory_script.sh.
Make the script executable by running the command chmod +x inventory_script.sh.
Run the script by running the command ./inventory_script.sh.
The script will generate a file named inventory_report.csv in the same directory as the script.
