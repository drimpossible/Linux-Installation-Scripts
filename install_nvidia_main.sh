#Go to Ctrl + Alt + F1
sudo service mdm stop
sudo bash ~/NVIDIA-Linux-x86_64-367.57.run
sudo bash ~/cuda_8.0.44_linux.run
sudo service mdm start
echo 'PATH="/usr/local/cuda/bin:$PATH"' >> ~/.profile
sudo echo '/usr/local/cuda/lib64' >> /etc/ld.so.conf
sudo ldconfig
source ~/.profile


