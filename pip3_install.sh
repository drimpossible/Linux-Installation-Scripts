# Install Anaconda
curl -O https://repo.anaconda.com/archive/Anaconda3-2019.03-Linux-x86_64.sh
bash Anaconda3-2019.03-Linux-x86_64.sh
source ~/.bashrc
conda create --name 3 python=3 -y
conda activate 3
conda install numpy scipy matplotlib ipython jupyter pandas sympy nose -y
conda uninstall -y --force pillow pil jped libtiff
conda install -yc conda-forge libjpeg-turbo
conda install pillow-simd
conda install pytorch torchvision cudatoolkit=10.0 -c pytorch


