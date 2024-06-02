#!/bin/bash

sudo yum update -y
sudo yum install -y docker
sudo systemctl start docker
sudo usermod -a -G docker ec2-user
sudo docker pull rogeazzam/pokemon-app
sudo systemctl start nginx
sudo systemctl enable nginx
