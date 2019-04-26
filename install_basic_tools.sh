sudo apt-get -y update
sudo apt-get -y install make cmake gcc g++ tmux ncdu htop gparted git-core git-gui git-doc dkms build-essential linux-headers-generic
sudo apt-get -y install python3-setuptools python3-venv python3-pip
sudo apt-get -y install gir1.2-gtop-2.0
sudo apt-get -y install texlive
sudo apt-get -y install texmaker
sudo apt-get -y install libboost-all-dev
sudo apt-get -y install leafpad npm calibre openssh-server
sudo apt-get -y install preload xpad pydf vim libopenblas-dev libhdf5-dev
sudo sed -i 's/false/true/g' /etc/apt/apt.conf.d/00recommends
git config --global url.https://github.com/.insteadOf git://github.com/
sudo ufw enable
