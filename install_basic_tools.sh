sudo apt update && sudo apt upgrade  
sudo apt install -y build-essential cmake g++ gcc gfortran git pkg-config python3-dev software-properties-common wget tmux ncdu htop gparted dkms linux-headers-generic libncurses-dev libboost-all-dev
sudo apt autoremove 
sudo rm -rf /var/lib/apt/lists/*

# Install OpenBLAS
mkdir ~/installs
cd ~/installs
git clone https://github.com/xianyi/OpenBLAS.git
cd OpenBLAS
make FC=gfortran -j $(($(nproc) + 1))
sudo make PREFIX=/usr/local install

# Install ZSH
sudo apt -y install zsh
# oh my zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"


# Install CUDA
wget -c https://developer.nvidia.com/compute/cuda/10.0/Prod/local_installers/cuda-repo-ubuntu1804-10-0-local-10.0.130-410.48_1.0-1_amd64
sudo dpkg -i cuda-repo-ubuntu1804-10-0-local-10.0.130-410.48_1.0-1_amd64
sudo apt-key add /var/cuda-repo-10-0-local-10.0.130-410.48/7fa2af80.pub
sudo apt -y update
sudo apt -y install cuda

sudo apt install -y libfreetype6-dev libpng12-dev texlive-full texmaker openssh-server libhdf5-dev
sudo apt remove -y mono-* libmono-* xscreensaver-gl
sudo ufw enable


