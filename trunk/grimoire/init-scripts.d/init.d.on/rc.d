#!/bin/bash
### BEGIN INIT INFO
# Required-Stop: $local_fs
# Should-Stop: initramfs tmp
# Default-Stop: 0 6
# Short-Description: rc.d updates symbolic links in /etc/rc.d
### END INIT INFO

# Copyright 2008 by Kyle Sallee, all rights reserved.
# for use with Sorcerer only

. /lib/lsb/init-functions

check(){ find /etc/init.d -maxdepth 1 -type f -cnewer /etc/rc.d | grep -q .; }
update(){ /lib/lsb/install_initd; }

if   log_warning_msg '/etc/rc.d checking'; check
then log_warning_msg '/etc/rc.d updating'; update
     log_success_msg '/etc/rc.d updated'
fi;  log_success_msg '/etc/rc.d checked'
