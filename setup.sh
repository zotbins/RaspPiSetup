#!/bin/bash

# This bash script is meant to be a simple script to quickly setup a raspberry pi.
# It does the following:
# 1. Set up the crontab file for scheduled tasks such as turning off the screen and doing automatic updates.
# 2. create the folder for storing json files and data (you need to add the json files yourself.
# 3. Clone the Digital Waste Bins Repository
# 4. Clone the ZotBins_Raspi Repository

#(Setup an Arudino IDE)
echo Setup Ardunio y/n:
read arduinosetup
if [ "$arduinosetup" == "y" ]; then
  sudo apt-get install arduino
fi

#(Set up Crontab files)
echo Setup crontab y/n:
read cronsetup
if [ "$cronsetup" == "y" ]; then
  cp checkwifi.sh /usr/local/bin/checkwifi.sh
  cp update.sh /usr/local/bin/update.sh
  echo Installing the crontab job...
  crontab mycron
fi
echo

#(Set screen orientation)
echo Setup screen orientation y/n:
read screensetup
if [ "$screensetup" == "y" ]; then
  echo Setting the Screen Orientation to be vertical
  sudo cp config.txt /boot/config.txt
fi
echo


echo Setup json files y/n:
read jsonsetup
if [ "$jsonsetup" == "y" ]; then
  #(Create the Folder for storing json files and data)
  echo Creating ZBinData folder for storing json files and data
  mkdir /home/pi/ZBinData
  echo

  #(Clone jsonfile into the ZBinData Folder)
  echo Copying user-specified jsonfile into the ZBinData Folder...
  python3 binData.py
fi
echo

#(Getting dependencies for Digital Waste Bins)
echo Setup DWB dependencies y/n:
read DWBsetup
if [ "$DWBsetup" == "y" ]; then
  echo Getting dependencies for Digital Waste Bins...
  sudo apt-get update
  sudo apt-get install qt5-default pyqt5-dev
  pip3 install playsound
fi
echo

#(Set-up running Animations on Startup)
echo Setup animations on startup y/n:
read startupsetup
if [ "$startupsetup" == "y" ]; then
  echo Setting up running animations on Startup...
  sudo apt-get install xterm -y
  mkdir /home/pi/.config/autostart
  sudo cp pythonscript.desktop /home/pi/.config/autostart
fi
echo

#(Set-up running ZotBins Data Collection on Startup)
echo Setup running ZotBins Script on startup y/n:
read startupZotBin
if [ "$startupZotBin" == "y" ]; then
  echo Setting up running ZotBins on Startup...
  sudo apt-get install xterm -y
  mkdir /home/pi/.config/autostart
  sudo cp zotbinsScript.desktop /home/pi/.config/autostart
fi
echo

#(Clone the Digital Waste Bins Repo)
echo Setup up Digital Waste Bins Repo Cloning y/n:
read dwbreposetup
if [ "$dwbreposetup" == "y" ]; then
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
fi
echo

#(Clone the ZotBins_Raspi Repo)
echo Setup ZotBins_Raspi Repo Cloning y/n:
read zotbinsreposetup
if [ "$zotbinsreposetup" == "y" ]; then
  echo Cloning the ZotBins_Raspi repo in /home/pi ...
  cd /home/pi
  git clone https://github.com/zotbins/ZotBins_RaspPi.git
fi
echo

#(Rebooting the Pi)
echo Reboot the pi y/n:
read reboottoggle
if [ "$reboottoggle" == "y" ]; then
  echo Rebooting the Pi...
  reboot
fi
