sudo add-apt-repository -y ppa:webupd8team/sublime-text-3
sudo add-apt-repository ppa:videolan/master-daily
sudo apt-get -y update
sudo apt-get -y install make cmake gcc g++
sudo apt-get -y install CMake
sudo apt-get -y install tmux
sudo apt-get -y install ncdu
sudo apt-get -y install htop
sudo apt-get -y install gparted
sudo apt-get -y install git-core git-gui git-doc
sudo apt-get -y install dkms build-essential linux-headers-generic
sudo apt-get -y install python-pip
sudo apt-get -y install python-setuptools
sudo apt-get -y install python3-setuptools
sudo apt-get -y install vlc
sudo apt-get -y install libdvd-pkg
sudo apt-get -y install gir1.2-gtop-2.0
sudo apt-get -y install sublime-text
sudo apt-get -y install linuxdcpp
sudo apt-get -y install texlive-full
sudo apt-get -y install texmaker
sudo apt-get -y install libboost-all-dev
sudo apt-get -y install gksu leafpad
sudo apt-get -y install preload
sudo apt-get -y install xpad
sudo apt-get -y install pydf
sudo apt-get -y install vim
sudo apt-get -y install checkinstall # allows for easy install/uninstall of packages from source
sudo apt-get -y install zsh
sudo apt-get -y install libopenblas-dev
sudo apt-get -y install libhdf5-dev
sudo apt-get -y install tree
sudo apt-get -y remove mono-runtime-common gnome-orca virtualbox-guest*
sudo apt-get -y install npm
sudo apt-get -y install calibre

sudo sed -i 's/false/true/g' /etc/apt/apt.conf.d/00recommends
git config --global url.https://github.com/.insteadOf git://github.com/
sudo ufw enable
