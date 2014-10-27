#!/bin/bash

GITHUB_SITE=""
SITE_NAME=""

## Clone the Site down
echo "Todd needs to clone the site down from Github..."
echo "Todd# sudo yum install git"
sudo yum install git -y

## Add the Nginx Repository
echo "Todd needs to add the Nginx repo"
echo "Todd# vi /etc/nginx/sites-enabled"
sudo cp ./nginx.repo /etc/yum.repos.d/
sleep 5s

## Install Nginx
echo "Todd needs to install Nginx..."
echo "Todd# sudo yum install nginx"
sudo yum install nginx -y

echo "Next up Todd clones the git repo..."
echo "Todd# git clone ${GITHUB_SITE} -o ${SITE_NAME}"
sleep 1s
pushd pushd /var/www &> /dev/null
git clone $GITHUB_SITE -o $SITE_NAME
echo "Todd# chown -R www-data:www-data /var/www/${SITE_NAME}"
sleep 1s
chown -R www-data:www-data /var/www/${SITE_NAME}

## Edit the Nginx config
echo "Now Todd needs to set up the vhost config for the site ..."
echo "Todd# vi /etc/nginx/sites-enabled"
sudo rm /etc/sites-enabled/*default*
sudo rm /etc/sites-available/*default*
sudo cp ./nginx.conf /etc/nginx/sites-available/${SITE_NAME}

for i in {1..5}
do
  echo "Working ..."
  sleep 5s
done

echo "Todd lets enable and start the site"
echo "Todd# sudo ln -s /etc/nginx/sites-enabled/${SITE_NAME} /etc/nginx/sites-available/${SITE_NAME}"
sudo ln -s /etc/nginx/sites-enabled/${SITE_NAME} /etc/nginx/sites-available/${SITE_NAME}

echo "Todd# sudo service nginx restart"
sudo service nginx restart

## Add mistyped config perhaps?
