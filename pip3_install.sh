# Install Anaconda
curl -O https://repo.anaconda.com/archive/Anaconda3-2019.03-Linux-x86_64.sh
bash Anaconda3-2019.03-Linux-x86_64.sh
conda create --name 3 python=3
conda activate 3
conda install numpy scipy matplotlib ipython jupyter pandas sympy nose
conda uninstall -y --force pillow pil jped libtiff
conda install -yc conda-forge libjpeg-turbo
conda install pillow-simd
