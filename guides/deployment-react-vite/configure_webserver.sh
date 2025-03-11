#!/bin/bash

echo -n "Please provide your git (SSH!) repo link: "
read -r git_repo_link

echo -n "Please provide your project machine name (lowercase/no spaces): "
read -r project_machine_name

echo -n "Please provide your project machine normal human name: "
read -r project_name

#clone and run build
mkdir ~/www/"$project_machine_name"
git clone "$git_repo_link" ~/www/"$project_machine_name"
cd ~/www/"$project_machine_name" || exit
npm install
npm run build

#move build to production folder
sudo mkdir -p /var/www/production
sudo cp -R ~/www/"$project_machine_name"/dist/* /var/www/production

#fix rights for folders/files
sudo chown -R www-data:www-data /var/www/production
sudo find /var/www/production -type d -exec chmod 775 {} \;
sudo find /var/www/production -type f -exec chmod 664 {} \;

#create nginx conf for new website (and unlink default conf)
sudo cp ~/nginx.conf /etc/nginx/sites-available/"$project_machine_name"
sudo ln -s /etc/nginx/sites-available/"$project_machine_name" /etc/nginx/sites-enabled/
sudo unlink /etc/nginx/sites-enabled/default

#restart nginx
sudo service nginx restart
