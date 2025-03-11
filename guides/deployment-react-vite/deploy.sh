#!/bin/bash

echo -n "Please provide your project machine name (lowercase/no spaces): "
read -r project_machine_name

#git pull and exit if no changes
cd ~/www/"$project_machine_name" || exit
git reset --hard HEAD
RESULT=$(git pull)
if [ "$RESULT" == "Already up to date." ]; then
    echo "No Git changes"
    exit
fi

#run scripts and rsync to production folder
npm install
npm run build
sudo rsync --quiet -av --delete ~/www/"$project_machine_name"/dist/ /var/www/production/

#fix rights for folders/files
sudo chown -R www-data:www-data /var/www/production
sudo find /var/www/production -type d -exec chmod 775 {} \;
sudo find /var/www/production -type f -exec chmod 664 {} \;
