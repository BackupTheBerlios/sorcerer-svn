#!/bin/bash
### BEGIN INIT INFO
# Default-Mode: 500
# Required-Stop: $local_fs
# Should-Stop: initramfs tmp
# Short-Description: updates symbolic links in /etc/rc.d/rc*.d/
### END INIT INFO

# Copyright 2008-2011 by Kyle Sallee, all rights reserved.
# for use with Modern Magic only

. /lib/lsb/init-functions

only stop status
deny control

check(){
 ! [ -d /etc/rc.d ] ||
   [ -n "$( /bin/find /etc/init.d -maxdepth 1 -type f -cnewer /etc/rc.d )" ]
}

update(){ /lib/lsb/install_initd; }

status(){
 if   log_warning_msg '/etc/rc.d check'; check
 then log_warning_msg '/etc/rc.d check status: not current'; return 1
 else log_success_msg '/etc/rc.d check status:     current'
 fi
}

stop(){
 if ! status; then
  log_warning_msg '/etc/rc.d update'; update
  log_success_msg '/etc/rc.d update'
 fi
}
