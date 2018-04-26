#! /bin/bash 
sudo su -
apt-get update -y
apt-get upgrade -y
apt-get install -y python3-pip
pip3 install --upgrade flask

# add -N so that wget do not duplicate copied files when reset 
# copy necessary files
sudo wget -N --directory-prefix=$HOME/ \
https://raw.githubusercontent.com/tdoan5/Kubernetes/master/todolist.db

sudo wget -N --directory-prefix=$HOME/ \
https://raw.githubusercontent.com/tdoan5/Kubernetes/master/todolist_api.py

# launch the app
python3 todolist_api.py
