#!/usr/bin/python

"""
=======================================================================================================================
Remote CLI Extraction for Linux Systems

Author: Javier Walters

Scope: Linux/UNIX/AppleMacOs Systems 

Purpose: Infultration and extraction of the Computer Name, MAC Address, Serial Number, OS, OS Version, MAnufacturer, MAke, and Model

Description: Bash will drop this file onto the remote computer(s) then activate the CLI Commands

=======================================================================================================================
"""

##OS will be displayed from the platform module of python
import platform
print('OS Distribution:', platform.system())
print('OS Version:', platform.version())

## Sockets will be imported to connect the specific nodes together over the network
import socket

## Get HostName from Socket Connection
HostName = socket.gethostname()
print("Computer Name:", HostName)

"""
Getting the IP Address from Socket Communication 
Import the Socket for use. The Sock Stream is for the TCP connection from Computer to target IP
"""
import socket
s = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
## Google's public DNS address
Google = "8.8.8.8"
## Connecting to Google using 443
s.connect((Google, 443))
## Prints out the IP Address relating to the Socket that is reaching out to $Google
IP_Address = s.getsockname()[0]
print('IP Address:', IP_Address)

"""
Get MAC Address. The "re" module allows for regular expressions
"uuid" works with the getnode to obtain the MAC of the computer
"""
import re 
import uuid
MAC = uuid.getnode()
MACAdd = ':'.join(re.findall('..', '%012x' % MAC))
print("MAC Address:", str(MACAdd.upper()))

## Subprocess will allow for the following commands to execute on the System CLI ##
import subprocess

## Command for Serial Number
SN = subprocess.check_output(["dmidecode", "-s", "system-serial-number"])
SN_No_B_OutPut = SN.decode()
print("Serial Number:", SN_No_B_OutPut.strip())

## Command for Manufacturer
MAN = subprocess.check_output(["dmidecode", "-s", "system-manufacturer"])
MAN_No_B_OutPut = MAN.decode()
print("Manufacturer:", MAN_No_B_OutPut.strip())

## Command for Device Model
Device_Model = subprocess.check_output(["dmidecode", "-s", "system-product-name"])
Model_No_B_OutPut = Device_Model.decode()
print("Device Model:", Model_No_B_OutPut.strip())

##################
## End of Script##
##################
