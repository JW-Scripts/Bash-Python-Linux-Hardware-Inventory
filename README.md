# Linux-Hardware-Inventory
This Hardware Inventory takes a hybrid approach using Bash and Python together. 
Root privileges must be estabilshed and enabled prior to execution of these scripts. 

# Description
The Bash and Python Script is used to gather Hardware information on remote Linux systems. This method has worked on tested environments such as Ubuntu, Mint, and Kali

# Variable Changes
Change the directories to your respected lcoations as required. 

Examples include the following:

$SEND_FILES variable:
"Your/ServerOrClient/Linux/Directory/to/Python-Script.py" - Change to your source machine
“$USERNAME@$ip:/home/target/path/for/python/script” - Change to the remote Linux system path to send the script

$Python_Output:
"$USERNAME@$ip "python3 /home/sent/location/python-script.py" - Change to remote Linux system path of sent Python Script to execute remote Python Script

# Procedure
Open the "Bash-Hardware-Info-Grab.sh" file, and Change Directories in the script as needed. 

Use the "Bash-Hardware-Info-Grab.sh" from the source computer. This will Send the "Python-Proxy-Hardware-Script.py" to the remote Linux servers/nodes to obtain the Hardware information on behalf of the Bash Script. 

Once all information has been gathered from the python script upon successful delievery, the Bash Script will take the information gathered, and save the results to the source computer. 

# Credits
Written by: Javier Walters

# Social Network
LinkedIn: https://www.linkedin.com/in/javier-walters/

