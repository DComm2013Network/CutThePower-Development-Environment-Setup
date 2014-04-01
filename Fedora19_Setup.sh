#/bin/bash

######################################################################
# Created to setup SDL and other dependencies required to
#  compile CutThePower on Fedora 19+.
#
# Installs the following packages:
#   - SDL2
#   - SDL2-devel
#   - SDL2_image
#   - SDL2_image-devel
#   - SDL2_mixer
#   - SDL2_mixer-devel
#   - SDL2_net
#   - freetype-devel
#   - SDL2_ttf
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

echo "CutThePower Lab Computer Environment Setup Script"
echo "------------------------------------------------"

echo "------------------------------------------------"
echo "Deleting old repositories"
echo "------------------------------------------------"

if [ -d "CutThePower" ]
then
    rm -rf CutThePower
fi

if [ -d "Server" ]
then
    rm -rf Server
fi

echo "------------------------------------------------"
echo "Installing SDL2, SDL2_image, SDL2_mixer.";
echo "------------------------------------------------"
yum install -y SDL2.x86_64 SDL2-devel.x86_64 SDL2_image.x86_64 SDL2_mixer.x86_64 SDL2_image-devel.x86_64 SDL2_mixer-devel.x86_64 freetype-devel.x86_64

echo "------------------------------------------------"
echo "Installing unzip";
echo "------------------------------------------------"
yum install -y unzip

echo "------------------------------------------------"
echo "Download SDL2_Net and SDL2_ttf";
echo "------------------------------------------------"
wget http://www.libsdl.org/projects/SDL_net/release/SDL2_net-2.0.0.zip
wget https://www.libsdl.org/projects/SDL_ttf/release/SDL2_ttf-2.0.12.zip

echo "------------------------------------------------"
echo "Unpacking SDL2_net";
echo "------------------------------------------------"
unzip SDL2_net-2.0.0.zip

echo "------------------------------------------------"
echo "CD to SDL2_net-2.0.0"
echo "------------------------------------------------"
cd SDL2_net-2.0.0

echo "------------------------------------------------"
echo "Installing SDL2_Net"
echo "------------------------------------------------"
./configure
make
make install

echo "------------------------------------------------"
echo "Deleting temp SDL_net files"
echo "------------------------------------------------"
cd ..
rm -rf SDL2_net-2.0.0 SDL2_net-2.0.0.zip

echo "------------------------------------------------"
echo "Unpacking SDL2_ttf";
echo "------------------------------------------------"
unzip SDL2_ttf-2.0.12.zip

echo "------------------------------------------------"
echo "CD to SDL2_ttf-2.0.12"
echo "------------------------------------------------"
cd SDL2_ttf-2.0.12

echo "------------------------------------------------"
echo "Installing SDL2_ttf"
echo "------------------------------------------------"
./configure
make
make install

echo "------------------------------------------------"
echo "Deleting temp SDL_ttf files"
echo "------------------------------------------------"
cd ..
rm -rf SDL2_ttf-2.0.12 SDL2_ttf-2.0.12.zip

echo "------------------------------------------------"
echo "Installing Git"
echo "------------------------------------------------"
yum install git

echo "------------------------------------------------"
echo "Cloning CutThePower game"
echo "------------------------------------------------"
git clone https://github.com/DComm2013Network/CutThePower.git

echo "------------------------------------------------"
echo "Cloning CutThePower server"
echo "------------------------------------------------"
git clone https://github.com/DComm2013Network/Server

echo "------------------------------------------------"
echo "Setting up SDL dependency path by making symlinks (hacky solution)"
echo "------------------------------------------------"
ln -s /usr/include/SDL2/* /usr/local/include/SDL2/
ln -s /usr/local/lib/libSDL2_net* /usr/lib64/
ln -s /usr/local/lib/libSDL2_ttf* /usr/lib64/

echo "------------------------------------------------"
echo "Trying ldconfig"
echo "------------------------------------------------"
ldconfig #Alternative to the *hacky solution* above.
