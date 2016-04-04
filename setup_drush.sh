#!/bin/sh

# Create .wgetrc file to force wget to use the tunnel as a proxy
cat > ~/.wgetrc << EOL 
http_proxy = http://localhost:8080/ 
https_proxy = https://localhost:8080/
use_proxy = on
wait = 15
EOL

# Set php56 path and an alias to use it as cli, add aliases for composer and drush
cat >> ~/.bashrc << EOL 

CURDIR=`pwd`
export PHP56="/usr/local/php5.6/bin/php"

alias php56=$PHP56
alias composer="$PHP56 -d memory_limit=128M ~/bin/composer"
alias drush='DRUSH_PHP=$PHP56 $PHP56 -d memory_limit=128M ~/.composer/vendor/bin/drush --php="$PHP56 -d memory_limit=128M -d auto_prepend_file=${CURDIR}/drush_prepend.php"'

EOL

# Source the new aliases
source ~/.bashrc

# Install composer
mkdir ~/bin
php56 -r "readfile('https://getcomposer.org/installer');" > composer-setup.php
php56 -r "if (hash('SHA384', file_get_contents('composer-setup.php')) === '7228c001f88bee97506740ef0888240bd8a760b046ee16db8f4095c0d8d525f2367663f22a46b48d072c816e7fe19959') { echo 'Installer verified'; } else { echo 'Installer corrupt'; unlink('composer-setup.php'); } echo PHP_EOL;"
php56 composer-setup.php
php56 -r "unlink('composer-setup.php');"
mv composer.phar ~/bin/composer && chmod +x ~/bin/composer

# 