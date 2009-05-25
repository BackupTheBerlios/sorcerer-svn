#!/bin/dash
### BEGIN INIT INFO
# Required-Stop: $local_fs
# Should-Stop: initramfs tmp
# Default-Stop: 0 6
# Short-Description: services.d updates /etc/services based upon the content of /etc/services.d/
### END INIT INFO

# Copyright 2009 by Kyle Sallee, all rights reserved.
# for use with Sorcerer only

. /lib/lsb/init-functions

check(){ find /etc/services.d -maxdepth 1 -type f -cnewer /etc/services | grep -q . || ! [ -f /etc/services ]; }
update(){
 find /etc/services.d/ -type f -maxdepth 1 |
 xargs -r --max-lines=256 \
 sed 's: *#.*::;s:  *:\t:g' > /etc/services
}

if   log_warning_msg '/etc/services.d checking'; check
then log_warning_msg '/etc/services   updating'; update
     log_success_msg '/etc/services   updated'
fi;  log_success_msg '/etc/services.d checked'
