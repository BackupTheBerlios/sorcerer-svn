#!/bin/bash
### BEGIN INIT INFO
# Default-Mode: 500
# Required-Stop: $local_fs
# Should-Stop: initramfs tmp
# Default-Stop: 0 6
# Short-Description: rc.d updates symbolic links in /etc/rc.d
### END INIT INFO

# Copyright 2008-2009 by Kyle Sallee, all rights reserved.
# for use with Sorcerer only

# if [ "$1" == try-restart ]; then exit 2; fi

. /lib/lsb/init-functions

deny try-restart

check(){ find /etc/init.d -maxdepth 1 -type f -cnewer /etc/rc.d | grep -q . || ! [ -d /etc/rc.d ]; }
update(){ /lib/lsb/install_initd; }

stop(){
 if   log_warning_msg '/etc/rc.d checking'; check
 then log_warning_msg '/etc/rc.d updating'; update
      log_success_msg '/etc/rc.d updated'
 fi;  log_success_msg '/etc/rc.d checked'
}
