#!/bin/bash

# This bash script is meant to be a simple script to quickly setup a raspberry pi.
# It does the following:
# 1. Set up the crontab file for scheduled tasks such as turning off the screen and doing automatic updates.
# 2. create the folder for storing json files and data (you need to add the json files yourself.
# 3. Clone the Digital Waste Bins Repository
# 4. Clone the ZotBins_Raspi Repository

#(Set up Crontab files)
echo Installing the crontab job
crontab mycron
echo

#(Set screen orientation)
echo Setting the Screen Orientation to be vertical
sudo cp config.txt /boot
echo

#(Create the Folder for storing json files and data)
echo Creating ZBinData folder for storing json files and data
mkdir /home/pi/ZBinData
echo

#(Clone jsonfile into the ZBinData Folder)
echo Copying user-specified jsonfile into the ZBinData Folder...
echo Hey! Input your path to jsonfile on ssh server eg. okyang@openlab.ics.uci.edu:~/*your_path*:
read jsonpath
scp $jsonpath /home/pi/ZBinData
echo

#(Getting dependencies for Digital Waste Bins)
echo Getting dependencies for Digital Waste Bins...
sudo apt-get update
sudo apt-get install qt5-default pyqt5-dev
echo

#(Set-up running Animations on Startup)
echo Setting up running animations on Startup...
mkdir /home/pi/.config/autostart
sudo cp pythonscript.desktop /home/pi/.config/autostart
echo

#(Clone the Digital Waste Bins Repo)
echo Cloning Digital Waste Bins Repo in /home/pi/DWB ...
mkdir /home/pi/DWB
cd /home/pi/DWB
git clone https://github.com/zotbins/DigitalWasteBins2019.git
echo

#(Creating the binType.txt file)
echo Creating the binType.txt file...
echo Hey! Input the bin type for binType.txt as compost, recylce, or landfill:
read binType
echo $binType >> binType.txt
echo

#(Clone the ZotBins_Raspi Repo)
echo Cloning the ZotBins_Raspi repo in /home/pi ...
cd /home/pi
git clone https://github.com/zotbins/ZotBins_RaspPi.git
echo

#(Rebooting the Pi)
echo Rebooting the Pi...
reboot


