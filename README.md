# Linux-Hardware-Inventory
This Hardware Inventory takes a hybrid approach using Bash and Python together. 

Root privileges must be estabilshed and enabled prior to execution of these scripts. 

Open the "Bash-Hardware-Info-Grab.sh" file, and Change Directories in the script as needed. 
Use the "Bash-Hardware-Info-Grab.sh" from the source computer. This will Send the "Python-Proxy-Hardware-Script.py" to the remote Linux servers/nodes to obtain the Hardware information on behalf of the Bash Script. 

Once all information has been gathered from the python script upon successful delievery, the Bash Script will take the information gathered, and save the results to the source computer. 
