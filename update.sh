#!/bin/sh
set -x
sudo docker-compose down
sudo docker-compose build
cd Hyperpipe
rm -rf docker-compose.yml
git pull
cd ..
cd hyperpipe-backend
rm -rf docker-compose.yml
git pull
cd ..
sudo docker-compose up -d
echo "Do not forget to clear old docker data!"
echo "feel free to run: sudo docker system prune -a; sudo docker volume prune ; sudo docker network prune; sudo docker image prune"
echo "but beaware any not running images will get deleted so make sure to run all needed docker containers before run this command!" 