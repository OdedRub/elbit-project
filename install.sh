#!/bin/bash

sudo yum -y install epel-release  # installs extra packages 
sudo yum -y update  # version update
sudo yum groupinstall "Development Tools" -y  # installs package of macros and debuggers for python
sudo yum install openssl-devel libffi-devel bzip2-devel -y  # installs required packages
sudo yum install wget -y  # for downloading content from the internet
wget https://www.python.org/ftp/python/3.10.2/Python-3.10.2.tgz  # downloads python3.10.2 installation files
sudo tar xvf Python-3.10.2.tgz  # unzipps the file
cd Python-3.10.2
./configure --enable-optimizations  # enables Profile Guided Optimization to improve Python's speed 
sudo make altinstall  # prevents overwriting existing Python installations
sudo yum install python3-pip -y  # installs pip
sudo pip3 install gunicorn requests Flask  # installs project's requirements
sudo yum install nginx -y  # installs nginx server
sudo systemctl enable nginx  # sets nginx to start on startup
sudo systemctl start nginx  # starts nginx
cd /home/vagrant/data
sudo mv nginx.conf /etc/nginx/nginx.conf  # replaces nginx configuration file
sudo rm /etc/nginx/nginx.conf.default
sudo mkdir /etc/nginx/certs
sudo openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/nginx/certs/server.key -out /etc/nginx/certs/server.crt -subj "/C=IL/ST=./L=./O=./CN=."  # creates self signed ssl certificates
sudo restorecon /etc/nginx/certs/*  # restores file's original context after its moving
sudo restorecon /etc/nginx/nginx.conf
sudo setsebool -P httpd_can_network_connect 1  # allows Apache httpd to make API requests to the internet
sudo systemctl restart nginx  
sudo mv gunicorn.service /etc/systemd/system/gunicorn.service  # copies gunicorn service to required location
sudo systemctl daemon-reload  # reloads configuration of systemd after changes being made
sudo systemctl enable gunicorn  # sets gunicorn service to start on startup
sudo systemctl start gunicorn  # starts gunicorn
sudo rm /home/vagrant/Python-3.10.2.tgz  # cleaning
sudo rm -rf /home/vagrant/Python-3.10.2  # cleaning
ip addr show  # shows assigned ip addresses
