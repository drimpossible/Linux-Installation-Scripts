# Basic installations
sudo apt update -y  && sudo apt upgrade -y
sudo apt install -y build-essential cmake g++ gcc gfortran git pkg-config python3-dev software-properties-common wget tmux ncdu htop gparted dkms linux-headers-generic libncurses-dev libboost-all-dev preload clamav
sudo apt autoremove -y 
sudo rm -rf /var/lib/apt/lists/*

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
wget https://downloads.slack-edge.com/linux_releases/slack-desktop-3.3.8-amd64.deb
sudo apt install ./slack-desktop-*.deb

# Install OpenBLAS
mkdir ~/installs
cd ~/installs
git clone https://github.com/xianyi/OpenBLAS.git
cd OpenBLAS
make FC=gfortran -j $(($(nproc) + 1))
sudo make PREFIX=/usr/local install

## Install ZSH
#sudo apt install -y zsh
## oh my zsh
#sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

# Install CUDA
wget -c https://developer.nvidia.com/compute/cuda/10.0/Prod/local_installers/cuda-repo-ubuntu1804-10-0-local-10.0.130-410.48_1.0-1_amd64
sudo dpkg -i cuda-repo-ubuntu1804-10-0-local-10.0.130-410.48_1.0-1_amd64
sudo apt-key add /var/cuda-repo-10-0-local-10.0.130-410.48/7fa2af80.pub
sudo apt update -y 
sudo apt install -y cuda

# Other basic utilies
sudo apt install -y libfreetype6-dev libpng12-dev texlive-full texmaker openssh-server libhdf5-dev
sudo apt remove -y mono-* libmono-* xscreensaver-gl
sudo apt-get remove -y openjdk*
sudo ufw enable
 
sudo dpkg-reconfigure fontconfig
sudo chown -R -v $USER:$USER $HOME
chmod -v 700 $HOME
sudo update-grub

sudo reboot

