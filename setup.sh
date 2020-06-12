#!/bin/bash

# install gcc
sudo apt-get update && sudo apt-get install -y gcc

# download deb file
wget https://developer.download.nvidia.com/compute/cuda/repos/ubuntu1604/x86_64/cuda-repo-ubuntu1604_9.2.88-1_amd64.deb

# install CUDA public key
sudo apt-key adv --fetch-keys http://developer.download.nvidia.com/compute/cuda/repos/ubuntu1604/x86_64/7fa2af80.pub

# install repository meta-data
sudo dpkg -i cuda-repo-ubuntu1604_9.2.88-1_amd64.deb

# install cuda 
sudo apt-get update && sudo apt-get install -y cuda-9-2

# add Cuda to path
export PATH=/usr/local/cuda-9.2/bin${PATH:+:${PATH}}
# check the installation
nvcc --version
nvidia-smi

# install repository
curl -s -L https://nvidia.github.io/nvidia-docker/gpgkey | \
  sudo apt-key add -
distribution=$(. /etc/os-release;echo $ID$VERSION_ID)
curl -s -L https://nvidia.github.io/nvidia-docker/$distribution/nvidia-docker.list | \
  sudo tee /etc/apt/sources.list.d/nvidia-docker.list
sudo apt-get update

sudo apt-get install -y unzip
sudo apt install -y docker.io

sudo groupadd docker
sudo usermod -aG docker $USER

echo 'Please reboot your Machine.'
