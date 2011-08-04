#!/bin/bash
### BEGIN INIT INFO
# Default-Mode: 500
# Required-Stop: $local_fs
# Should-Stop: initramfs tmp
# Default-Stop: 0 6
# Short-Description: updates symbolic links in /etc/rc.d/rc*.d/
### END INIT INFO

# Copyright 2008-2011 by Kyle Sallee, all rights reserved.
# for use with Sorcerer only

. /lib/lsb/init-functions

only stop status
deny control

check(){ find /etc/init.d -maxdepth 1 -type f -cnewer /etc/rc.d | grep -q . || ! [ -d /etc/rc.d ]; }
update(){ /lib/lsb/install_initd; }

status(){
 if   log_warning_msg '/etc/rc.d checking'; check
 then log_warning_msg '/etc/rc.d checked; status not current'; return 1
 else log_success_msg '/etc/rc.d checked; status     current'
 fi
}

stop(){
 if ! status; then
  log_warning_msg '/etc/rc.d updating'; update
  log_success_msg '/etc/rc.d updated'
 fi
}
