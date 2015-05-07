# .bashrc

# User specific aliases and functions

# Source global definitions
if [ -f /etc/bashrc ]; then
        . /etc/bashrc
fi

export PATH="~/drush:$PATH"

CURDIR=`pwd`
#export DRUSH_PHP="/usr/local/bin/php.ORIG.5.4.6"
#export PHP_OPTIONS="-dallow_call_time_pass_reference= -dmagic_quotes_gpc= -dregister_globals= -dauto_prepend_file=${CURDIR}/drush_prepend.php"

#alias drush='/usr/local/bin/php.ORIG.5.4.6 -d memory_limit=128M ~/drush/drush.php --php="/usr/local/bin/php.ORIG.5.4.6 -d memory_limit=128M -d auto_prepend_file=${CURDIR}/drush_prepend.php -d register_globals= -d allow_call_time_pass_reference="'
alias drush='/usr/local/bin/php.ORIG.5.4.6 -d memory_limit=128M ~/drush/drush.php --php="/usr/local/bin/php.ORIG.5.4.6 -d memory_limit=128M -d auto_prepend_file=${CURDIR}/drush_prepend.php"'
