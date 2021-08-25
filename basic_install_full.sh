# Basic installations
sudo apt update -y  && sudo apt upgrade -y
sudo apt install -y build-essential cmake autoconf automake libtool g++ gcc gfortran git pkg-config python3-dev python3-pip python3-venv software-properties-common wget tmux ncdu htop gparted dkms linux-headers-generic libncurses-dev libboost-all-dev preload clamav libjpeg-turbo8-dev
sudo apt install -y libssl-dev libffi-dev libxml2-dev libxslt1-dev zlib1g-dev
sudo apt autoremove -y 
sudo rm -rf /var/lib/apt/lists/*
mkdir ~/installs
python3 -m venv ~/installs/3

# Move config files - System optimizations
sudo mv ./config_files/grub /etc/default/grub
sudo mv ./config_files/sysctl.conf /etc/sysctl.conf
mv ./config_files/.bashrc ~/.bashrc

sudo cp -v /usr/share/systemd/tmp.mount /etc/systemd/system/
sudo systemctl enable tmp.mount
sudo apt-get purge -y *flatpak* xdg-desktop-portal
sudo apt-get install -y --no-install-recommends gnome-software
sudo apt-get remove -y fonts-kacst* fonts-khmeros* fonts-lklug-sinhala fonts-guru-extra fonts-nanum* fonts-noto-cjk fonts-takao* fonts-tibetan-machine fonts-lao fonts-sil-padauk fonts-sil-abyssinica fonts-tlwg-* fonts-lohit-* fonts-beng-extra fonts-gargi fonts-gubbi fonts-gujr-extra fonts-kalapi fonts-lohit-* fonts-samyak* fonts-navilu fonts-nakula fonts-orya-extra fonts-pagul fonts-sarai fonts-telu* fonts-wqy* fonts-smc* fonts-deva-extra fonts-sahadeva
sudo sed -i 's/false/true/g' /etc/apt/apt.conf.d/00recommends
sudo apt-get remove mono-runtime-common gnome-orca

# Install slack
sudo snap install slack --classic

# Install CUDA
wget https://developer.download.nvidia.com/compute/cuda/repos/ubuntu2004/x86_64/cuda-ubuntu2004.pin
sudo mv cuda-ubuntu2004.pin /etc/apt/preferences.d/cuda-repository-pin-600
wget https://developer.download.nvidia.com/compute/cuda/11.4.1/local_installers/cuda-repo-ubuntu2004-11-4-local_11.4.1-470.57.02-1_amd64.deb
sudo dpkg -i cuda-repo-ubuntu2004-11-4-local_11.4.1-470.57.02-1_amd64.deb
sudo apt-key add /var/cuda-repo-ubuntu2004-11-4-local/7fa2af80.pub
sudo apt-get -y update
sudo apt-get -y install cuda

#Install FFMPEG
sudo apt-get install -y libavformat-dev libavcodec-dev libavdevice-dev libavutil-dev libswscale-dev libavresample-dev libavfilter-dev ffmpeg

source ~/.bashrc
reset

# Other basic utilies
sudo apt install -y libfreetype6-dev libpng12-dev texlive-full texmaker openssh-server libhdf5-dev
sudo apt remove -y mono-* libmono-* xscreensaver-gl
sudo apt-get remove -y openjdk*
sudo ufw enable

sudo apt update -y  && sudo apt upgrade -y
#bash pip3_install.sh
 
sudo dpkg-reconfigure fontconfig
sudo add-apt-repository ppa:lyx-devel/release
sudo apt update -y && sudo apt install -y lyx
sudo update-grub

sudo reboot

