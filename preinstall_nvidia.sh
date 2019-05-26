sudo cp ./config_files/blacklist-noveau.conf /etc/modprobe.d/
sudo echo options nouveau modeset=0 | sudo tee -a /etc/modprobe.d/nouveau-kms.conf
sudo apt-get purge nvidia-*
sudo update-initramfs -u
