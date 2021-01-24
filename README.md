# Oxide Plugin Updater
A simple bash script to update oxide plugins in a folder

## Requirements

- pcregrep
- wget

## Installation

1. Install required packages:  
  `$ sudo apt-get install wget pcregrep`
2. Clone the repo  
  `$ git clone https://github.com/Winter/oxide-plugin-updater`
  
## Usage

1. Edit the `PLUGINS_DIRECTORY` variable in `update.sh` to your oxide plugins folder
2. Update file permissions
  `$ chmod +x update.sh`
3. Run `update.sh`
  `$ ./update.sh`
