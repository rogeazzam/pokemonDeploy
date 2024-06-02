#!/bin/bash

sudo yum update -y
sudo yum install -y docker
sudo systemctl start docker
sudo usermod -a -G docker ec2-user
sudo docker pull mongo
sudo docker create -it --name MongoTest -p 5000:27017 mongo
sudo docker start MongoTest
sudo yum install -y git
sudo yum install -y nginx
sudo systemctl start nginx
sudo systemctl enable nginx

sudo curl -L "https://github.com/docker/compose/releases/download/v2.12.2/docker-compose-$(uname -s)-$(uname -m)"  -o /usr/local/bin/docker-compose
sudo mv /usr/local/bin/docker-compose /usr/bin/docker-compose
sudo chmod +x /usr/bin/docker-compose

git clone https://github.com/rogeazzam/FlaskMongoAPI.git /home/ec2-user/FlaskMongoAPI
