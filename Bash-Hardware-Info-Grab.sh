#/bin/bash

################################################################
## NOTE: YOU MUST CHANGE DIRECTORIES AS NEEDED PRIOR TO EXECUTION

#Title: Remote Hardware Information Gathering 
#Description: 
	## SSH Into list of devices from source server/client using Bash
	## Send Python Script to devices
	## Execute Python Script on the Remote Devices
	## Collected information will show results in the source's shell/screen
	## Export results to CSV in source directory 

################################################################

Result_Export_Path="/home/source/path/List_of_Linux_Systems_Hardware_Info.csv"

## Creates CSV File Header 
echo "Computer Name", "OS Distribution", "OS Version", "MAC Address", "IP Address", "Serial Number", "Manufacturer", "Model" >> $Result_Export_Path

## Remote Username for SSH Logon
USERNAME="YOUR SSH NAME"

##List of Target IP Addresses
IP_LIST="/home/source/path/IP_List.txt"

## Bash commands will run against Each IP address (Linux Client, Server, node, etc.) in the IP_List
for ip in $(cat "$IP_LIST"); 
do 

##Sends Python Script from source to Remote Computers Using SSH
SEND_FILES=$(scp -r "Your/ServerOrClient/Linux/Directory/to/Python-Script.py" $USERNAME@$ip:/home/target/path/for/python/script)

## Command to execute Script on Remote Computers
Python_Output=$( ssh $USERNAME@$ip "python3 /home/sent/location/python-script.py") 

## The Python script will execute on each computer once delievery is successful
            if [ $SEND_FILES ];
            then $Python_Output ## Executes Python Command
            else echo $Python_Output ## Displays Command output for each device  

## AWK will grab the output of the Python Script for each computer, adding those values to the CSV file
CN=$(ssh $USERNAME@$ip "python3 /home/target/path/for/python/script/Python-Script.py" | awk -F "Computer Name:" '{ printf $2}')
OS=$(ssh $USERNAME@$ip "python3 /home/target/path/for/python/script/Python-Script.py" | awk -F "OS Distribution:" '{ printf $2}')
OSV=$(ssh $USERNAME@$ip "python3 /home/target/path/for/python/script/Python-Script.py" | awk -F "OS Version:" '{ printf $2}')
MAC=$(ssh $USERNAME@$ip "python3 /home/target/path/for/python/script/Python-Script.py" | awk -F "MAC Address:" '{ printf $2}')
IP=$(ssh $USERNAME@$ip "python3 /home/target/path/for/python/script/Python-Script.py" | awk -F "IP Address:" '{ printf $2}')
SN=$(ssh $USERNAME@$ip "python3 /home/target/path/for/python/script/Python-Script.py" | awk -F "Serial Number:" '{ printf $2}')
MANU=$(ssh $USERNAME@$ip "python3 /home/target/path/for/python/script/Python-Script.py" | awk -F "Manufacturer:" '{ printf $2}')
MODEL=$(ssh $USERNAME@$ip "python3 /home/target/path/for/python/script/Python-Script.py" | awk -F "Device Model:" '{ printf $2}')

fi
## Value of Each Output will be sent to the CSV file located at the Source Path
echo "$CN,$OS,$OSV,$MAC,$IP,$SN,$MANU,$MODEL" >> $Result_Export_Path

done

#######################
#####END of SCRIPT#####
#######################



