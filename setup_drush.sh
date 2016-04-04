#!/bin/sh

echo "Creating .wgetrc file to force wget to use the tunnel as a proxy..."
cat > ~/.wgetrc << EOL 
http_proxy = http://localhost:8080/ 
https_proxy = https://localhost:8080/
use_proxy = on
wait = 15
EOL

echo "Updating .bashrc with php56 path..."
cat >> ~/.bashrc << EOL 

export PHP56="/usr/local/php5.6/bin/php"
alias php56=$PHP56

EOL

echo "Sourcing .bashrc to make the aliases available..."
source ~/.bashrc

echo "Installing Composer in ~/bin/composer..."
mkdir ~/bin
php56 -r "readfile('https://getcomposer.org/installer');" > composer-setup.php
php56 -r "if (hash('SHA384', file_get_contents('composer-setup.php')) === '7228c001f88bee97506740ef0888240bd8a760b046ee16db8f4095c0d8d525f2367663f22a46b48d072c816e7fe19959') { echo 'Installer verified'; } else { echo 'Installer corrupt'; unlink('composer-setup.php'); } echo PHP_EOL;"
php56 composer-setup.php
php56 -r "unlink('composer-setup.php');"
mv composer.phar ~/bin/composer && chmod +x ~/bin/composer

echo "Installing Drush globally with composer in ~/.composer/vendor/drush..."
composer global require drush/drush:dev-master

echo "Creating .bashrc aliases for Composer and Drush..."
cat >> ~/.bashrc << EOL
alias composer="$PHP56 -d memory_limit=128M ~/bin/composer"
alias drush='DRUSH_PHP=$PHP56 $PHP56 -d memory_limit=128M ~/.composer/vendor/bin/drush --php="$PHP56 -d memory_limit=128M -d auto_prepend_file=${CURDIR}/drush_prepend.php"'

EOL

echo "All done! Try to run 'composer' then 'drush' to make sure nothing went wrong!"
echo "Have a nice day/night!"