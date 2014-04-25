#/bin/bash

######################################################################
# Created to setup SDL and other dependencies required to
#  compile CutThePower on Ubuntu 12.04+.
#
# Installs the following packages:
#   - SDL2
#   - SDL2-devel
#   - SDL2_image
#   - SDL2_image-devel
#   - SDL2_mixer
#   - SDL2_mixer-devel
#   - SDL2_net
#   - SDL2_ttf
#   - etc.. (all of their dependencies)
#
# It also install the `unzip` package if it's not already
#  installed.
#
# It also clones the `CutThePower` game and the `server`
#  GIT repository in the current directory.
#
#  CutThePower: https://github.com/DComm2013Network/CutThePower [GAME]
#  Server: https://github.com/DComm2013Network/CutThePower [SERVER]
######################################################################

#############################
# Important Libraries
#############################
sudo apt-get install -y git unzip build-essential xorg-dev libudev-dev libts-dev libgl1-mesa-dev libglu1-mesa-dev libasound2-dev libpulse-dev libopenal-dev libogg-dev libvorbis-dev libaudiofile-dev libpng12-dev libfreetype6-dev libusb-dev libdbus-1-dev zlib1g-dev libdirectfb-dev libgles2-mesa-dev libaudio-dev libsndobj-dev libwebp-dev libtiff4-dev

##########################
# Downloading SDL source
##########################
wget http://www.libsdl.org/release/SDL2-2.0.3.zip
wget https://www.libsdl.org/projects/SDL_ttf/release/SDL2_ttf-2.0.12.zip
wget https://www.libsdl.org/projects/SDL_net/release/SDL2_net-2.0.0.zip
wget https://www.libsdl.org/projects/SDL_mixer/release/SDL2_mixer-2.0.0.zip
wget https://www.libsdl.org/projects/SDL_image/release/SDL2_image-2.0.0.zip

##########################
# Unzip all source files
##########################
unzip SDL2-2.0.3.zip
unzip SDL2_ttf-2.0.12.zip
unzip SDL2_net-2.0.0.zip
unzip SDL2_mixer-2.0.0.zip
unzip SDL2_image-2.0.0.zip

##########################
# Installing from source
##########################
cd SDL2-2.0.3
./configure
make
sudo make install

cd ..

cd SDL2_ttf-2.0.12
./configure
make
sudo make install

cd ..

cd SDL2_net-2.0.0
./configure
make
sudo make install

cd ..

cd SDL2_mixer-2.0.0
./configure
make
sudo make install

cd ..

cd SDL2_image-2.0.0
./configure
make
sudo make install

cd ..

######################
# Everything's done
######################
sudo ldconfig

####################################
# Remove source files
####################################
rm -rf SDL2-2.0.3.zip SDL2-2.0.3
rm -rf SDL2_ttf-2.0.12.zip SDL2_ttf-2.0.12
rm -rf SDL2_net-2.0.0.zip SDL2_net-2.0.0
rm -rf SDL2_mixer-2.0.0.zip SDL2_mixer-2.0.0
rm -rf SDL2_image-2.0.0.zip SDL2_image-2.0.0

######################
# Cloning GitHub repos
######################
git clone https://github.com/DComm2013Network/CutThePower.git
git clone https://github.com/DComm2013Network/Server

