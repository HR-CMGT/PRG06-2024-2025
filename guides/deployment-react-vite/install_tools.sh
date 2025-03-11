#!/bin/bash

#make sure package index is up-to-date
sudo apt update

#remove apache
sudo systemctl stop apache2
sudo apt purge apache2 apache2-utils apache2-bin apache2.2-common -y
sudo apt autoremove -y
sudo rm -rf /etc/apache2
sudo service stop apache2
sudo apt -y remove apache2*
sudo apt -y autoremove
sudo rm /var/www/html/index.html

#install all relevant tools
sudo apt -y install curl wget gpg gnupg2 lsb-release software-properties-common ca-certificates apt-transport-https zip unzip tar git build-essential nginx htop nano net-tools tmux

#add your user to the www-data group
current_user=$(whoami)
sudo usermod -a -G www-data "$current_user"

#install certbot (via snap)
sudo snap install core
sudo snap refresh core
sudo snap install --classic certbot
sudo ln -s /snap/bin/certbot /usr/bin/certbot

#generate ssh key needed for git checkout
ssh-keygen -q -t rsa -N '' -f ~/.ssh/id_rsa <<<y >/dev/null 2>&1

#install node/npm via nvm
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.1/install.sh | bash
source ~/.bashrc
command -v nvm
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
nvm install --lts

#inform user of final result
echo "All tools are installed, check any errors above in the logs"
