#!/bin/bash

GITHUB_SITE="https://github.com/jarosser06/magic"
SITE_NAME="magic"

echo "Todd is preparing..."

## Clean up the cache
sudo apt-get update &> /dev/null

## Clone the Site down
echo "Todd# sudo apt-get install git"
sleep 2s
sudo apt-get install git -y &> /dev/null

## Add the Nginx Repository
echo "Todd# vi /etc/nginx/apt/sources.list.d"
sudo cp ./nginx.list /etc/apt/sources.list.d/nginx.list &> /dev/null
sleep 8s

## Install Nginx
echo "Todd# sudo apt-get install nginx"
sleep 2s
sudo apt-get install nginx -y &> /dev/null

echo "Todd# mkdir /var/www"
sleep 2s
sudo mkdir /var/www &> /dev/null
echo "Todd# sudo git clone ${GITHUB_SITE} /var/www/${SITE_NAME}"
sleep 2s
sudo git clone $GITHUB_SITE /var/www/$SITE_NAME &> /dev/null
echo "Todd# chown -R www-data:www-data /var/www"
sleep 1s
sudo chown -R www-data:www-data /var/www/${SITE_NAME}

## Edit the Nginx config
echo "Todd# vi /etc/nginx/sites-enabled"
sleep 5s
sudo rm /etc/nginx/sites-enabled/*default* &> /dev/null
sudo rm /etc/nginx/sites-available/*default* &> /dev/null
sudo cp ./nginx.conf /etc/nginx/sites-available/${SITE_NAME} &> /dev/null

for i in {1..5}
do
  echo "Working ..."
  sleep 5s
done

echo "Todd# sudo ln -s /etc/nginx/sites-available/${SITE_NAME} /etc/nginx/sites-enabled/${SITE_NAME}"
sleep 3s
sudo ln -s /etc/nginx/sites-available/${SITE_NAME} /etc/nginx/sites-enabled/${SITE_NAME} &> /dev/null

echo "Todd# sudo service nginx restart"
sleep 1s
sudo service nginx restart &> /dev/null
