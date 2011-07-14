#!/bin/bash

### BEGIN INIT INFO
# Default-Mode: 500
# Required-Start: $local_fs
# Default-Start: S
# Short-Description: saves configuration files that were modified during sysinit
### END INIT INFO

[ "$1" == try-restart ]              && exit 5
[ -d            /etc/init.d/conf.d ] || exit 0
[ -d /media/root/etc/init.d        ] || exit 0
[ -d /media/root/etc/init.d/conf.d ] || mkdir -m 700 \
     /media/root/etc/init.d/conf.d

. /lib/lsb/init-functions

start(){
 run(){
  find /etc/init.d/conf.d/ -type f |
  while read; do
   if   [      $REPLY -nt /media/root/$REPLY ]
   then cp -av $REPLY     /media/root/$REPLY
   fi
  done
 }

 if   log_warning_msg "/etc/init.d/conf.d checking"; run
 then log_success_msg "/etc/init.d/conf.d checked"
 else log_failure_msg "/etc/init.d/conf.d failed"
 fi
}
