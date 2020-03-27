# RaspPi Setup

This script is meant  to easily setup the Raspberry Pi for both Digital ZotBins use and Non-Digital ZotBins use. A Digital ZotBin also uses code from both the [DigitalWasteBins2019](https://github.com/zotbins/DigitalWasteBins2019) repository and the [ZotBins_Raspi](https://github.com/zotbins/ZotBins_RaspPi) repository. The Non-Digital ZotBins Raspberry Pi setup only uses the [ZotBins_Raspi](https://github.com/zotbins/ZotBins_RaspPi) repository.

# Running
The main script you want to run is the `setup.sh` in the terminal:
```
./setup.sh
```
These are the different sections that the script will set-up for you:
- Crontab Files
- Screen orientation
- Directly downloading an already setup .json file for ZotBins from an ssh server
- Getting the dependencies for Digital ZotBins
- Setting up running Animations on Startup
- Cloning the Digital Waste Bins Repository from GitHub
- Cloning the ZotBins Repository from GitHub
