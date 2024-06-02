#!/bin/bash

sudo yum update -y
sudo touch /etc/yum.repos.d/mongodb-org-7.0.repo
sudo printf "[mongodb-org-7.0]\nname=MongoDB Repository\nbaseurl=https://repo.mongodb.org/yum/amazon/2023/mongodb-org/7.0/x86_64/\ngpgcheck=1\nenabled=1\ngpgkey=https://pgp.mongodb.com/server-7.0.asc\n" > /etc/yum.repos.d/mongodb-org-7.0.repo
sudo yum install -y mongodb-org
sudo systemctl start mongod
sudo dnf erase -qy mongodb-mongosh
sudo dnf install -qy mongodb-mongosh-shared-openssl3
sudo systemctl restart mongod
sudo yum install -y docker
sudo systemctl start docker
sudo usermod -a -G docker ec2-user
sudo yum install -y git
sudo yum install -y nginx
sudo systemctl start nginx
sudo systemctl enable nginx

sudo curl -L "https://github.com/docker/compose/releases/download/v2.12.2/docker-compose-$(uname -s)-$(uname -m)"  -o /usr/local/bin/docker-compose
sudo mv /usr/local/bin/docker-compose /usr/bin/docker-compose
sudo chmod +x /usr/bin/docker-compose

git clone https://github.com/rogeazzam/FlaskMongoAPI.git /home/ec2-user/
