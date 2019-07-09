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
wget https://downloads.slack-edge.com/linux_releases/slack-desktop-3.3.8-amd64.deb
sudo apt install ./slack-desktop-*.deb
rm ./slack-desktop-3.3.8-amd64.deb

# Install Discord
wget -O discord.deb "https://discordapp.com/api/download?platform=linux&format=deb"
sudo apt install --fix-broken ./discord.deb
rm ./discord.deb

# Install OpenBLAS
cd ~/installs
git clone https://github.com/xianyi/OpenBLAS.git
cd OpenBLAS
make FC=gfortran -j $(($(nproc) + 1))
sudo make PREFIX=/usr/local install
cd ~

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

# Install Intel MKL Libraries & configure defaults to use these
wget https://apt.repos.intel.com/intel-gpg-keys/GPG-PUB-KEY-INTEL-SW-PRODUCTS-2019.PUB
sudo apt-key add GPG-PUB-KEY-INTEL-SW-PRODUCTS-2019.PUB
sudo sh -c 'echo deb https://apt.repos.intel.com/mkl all main > /etc/apt/sources.list.d/intel-mkl.list'
sudo sh -c 'echo deb https://apt.repos.intel.com/ipp all main > /etc/apt/sources.list.d/intel-ipp.list'
sudo sh -c 'echo deb https://apt.repos.intel.com/tbb all main > /etc/apt/sources.list.d/intel-tbb.list'
sudo sh -c 'echo deb https://apt.repos.intel.com/daal all main > /etc/apt/sources.list.d/intel-daal.list'
sudo sh -c 'echo deb https://apt.repos.intel.com/mpi all main > /etc/apt/sources.list.d/intel-mpi.list'
sudo sh -c 'echo deb https://apt.repos.intel.com/intelpython binary/ > /etc/apt/sources.list.d/intelpython.list'
sudo apt update -y && sudo apt install -y intel-mkl-64bit-2019.4-070 intel-ipp-64bit-2019.4-070 intel-tbb-64bit-2019.6-070 intel-mpi-2019.4-070 intelpython3
sudo update-alternatives --install /usr/lib/x86_64-linux-gnu/libblas.so     libblas.so-x86_64-linux-gnu      /opt/intel/mkl/lib/intel64/libmkl_rt.so 150
sudo update-alternatives --install /usr/lib/x86_64-linux-gnu/libblas.so.3   libblas.so.3-x86_64-linux-gnu    /opt/intel/mkl/lib/intel64/libmkl_rt.so 150
sudo update-alternatives --install /usr/lib/x86_64-linux-gnu/liblapack.so   liblapack.so-x86_64-linux-gnu    /opt/intel/mkl/lib/intel64/libmkl_rt.so 150
sudo update-alternatives --install /usr/lib/x86_64-linux-gnu/liblapack.so.3 liblapack.so.3-x86_64-linux-gnu  /opt/intel/mkl/lib/intel64/libmkl_rt.so 150
sudo sh -c "echo '/opt/intel/lib/intel64'     >  /etc/ld.so.conf.d/mkl.conf"
sudo sh -c "echo '/opt/intel/mkl/lib/intel64' >> /etc/ld.so.conf.d/mkl.conf"
sudo ldconfig
sudo sh -c "echo 'MKL_THREADING_LAYER=GNU' >> /etc/environment"

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

