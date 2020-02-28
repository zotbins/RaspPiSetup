#!/bin/bash

# This bash script is meant to be a simple script to quickly setup a raspberry pi.
# It does the following:
# 1. Set up the crontab file for scheduled tasks such as turning off the screen and doing automatic updates.
# 2. create the folder for storing json files and data (you need to add the json files yourself.
# 3. Clone the Digital Waste Bins Repository
# 4. CLone the ZotBins_Raspi Repository
# 

#(1) Set up Crontab files


#(2)
mkdir /home/pi/ZBinData

#(3) Clone the Digital Waste Bins Repo
mkdir /home/pi/DWB
cd /home/pi/DWB
git clone https://github.com/zotbins/DigitalWasteBins2019.git

#(4) CLone the ZotBins_Raspi Repo
cd /home/pi
git clone https://github.com/zotbins/ZotBins_RaspPi.git



