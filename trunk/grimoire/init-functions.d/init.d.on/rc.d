#!/bin/bash
### BEGIN INIT INFO
# Provides: rc.d
# Required-Stop: $local_fs
# Should-Stop: initramfs tmp
# Default-Stop: 0 6
# Short-Description: rc.d updates symbolic links in /etc/rc.d
### END INIT INFO

# Copyright 2008 by Kyle Sallee, all rights reserved.
# for use with Sorcerer only

. /lib/lsb/init-functions

NAME=/etc/rc.d

check(){ find /etc/init.d -maxdepth 1 -type f -newer /etc/rc.d | grep -q .; }
update(){ /lib/lsb/install_initd; }

if   log_warning_msg "$NAME checking"; check
then log_warning_msg "$NAME updating"; update
     log_success_msg "$NAME updated"
fi;  log_success_msg "$NAME checked"
