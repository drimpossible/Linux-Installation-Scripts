git clone https://github.com/torch/distro.git ~/torch --recursive
cd ~/torch; sudo bash install-deps;
./install.sh
source ~/.bashrc
luarocks install torch --local
luarocks install cutorch --local
luarocks install nn --local
luarocks install cunn --local
luarocks install cudnn --local
luarocks install optim --local
luarocks install image --local
luarocks install torchnet --local
luarocks install optnet --local
luarocks install iterm --local
luarocks install paths --local
luarocks install xlua --local
luarocks install trepl --local
luarocks install dp --local
luarocks install nnlr --local
luarocks install nninit --local
luarocks install npy4th --local
