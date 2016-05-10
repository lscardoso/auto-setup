#!/bin/bash

# Pause function
function pause() {
	read -p "$*"
}

echo ""
echo "This script will automatically setup a recently installed"
echo "ubuntu environment"
echo ""
echo "It will take a long time to run and wont accept interruptions"
echo ""
echo "be sure to have:"
echo "   * an internet connection"
echo "   * an administrator access"
echo ""
echo "You're about to start the process."
pause "Press any key to continue or ctrl-c to stop"
echo ""
echo "please type your sudo password"
sudo date > /dev/null
echo ""

DATE=`date +%Y-%m-%d_%H:%M`
# Isolate the auto-config environment
cd
mkdir "temp-$DATE"
cd "temp-$DATE"

# System and Ubuntu
echo -ne "Updating the system (this might take some time). "
sudo apt-get -qq update
sudo apt-get -qq upgrade
echo "done."

# Install required packages
echo -ne "Installing required ubuntu packages. "
sudo apt-get -q install vim && echo -ne "vim "
echo "done."


# Install third party packages
echo -ne "Installing third party software. "
wget -q https://download.sublimetext.com/sublime-text_build-3103_amd64.deb && sudo dpkg -i sublime-text_build-3103_amd64.deb > /dev/null && echo -ne "sublime. "
echo "done."

# GNU Radio installation
#wget -q "http://www.sbrac.org/files/build-gnuradio" && chmod a+x ./build-gnuradio
./build-gnuradio -ja



