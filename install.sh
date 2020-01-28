#!/bin/bash

echo '=> Start dotfiles'

# Remove unused 
echo '=> Remove unused'
sudo apt purge -y aisleriot brasero empathy evolution gnome-mahjongg gnome-mines gnome-sudoku
sudo apt autoremove -y

#Add Sources
echo '=> Add sources'
sudo sh -c "echo 'deb http://download.opensuse.org/repositories/home:/manuelschneid3r/xUbuntu_18.04/ /' > /etc/apt/sources.list.d/home:manuelschneid3r.list"
wget -nv https://download.opensuse.org/repositories/home:manuelschneid3r/xUbuntu_18.04/Release.key -O Release.key
sudo apt-key add - < Release.key
echo '=> Done'

# => System update/upgrade
echo '=> Update repository information'
sudo apt-get update -qqtr
echo '=> Performe system upgrade'
sudo apt-get dist-upgrade -y
echo '=> Performe apps upgrade'
sudo apt-get upgrade -y
echo 'Done.'

#Add Packages
echo '=> Add apps'
sudo apt update
sudo apt install -y snapd albert flameshot terminator
sudo snap install --classic code slack
sudo snap install --classic slack
sudo snap install mailspring spotify

sh -c "$(wget -O- https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

wget http://cdn.mysql.com/Downloads/MySQLGUITools/mysql-workbench-community_8.0.18-1ubuntu18.04_amd64.deb -O mysql-workbench-community.deb
sudo dpkg -i mysql-workbench-community.deb
sudo apt-get -f install

wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
sudo dpkg -i google-chrome-stable_current_amd64.deb
echo '=> Final done.'
