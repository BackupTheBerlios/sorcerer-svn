#!/bin/bash

### BEGIN INIT INFO
# Default-Mode: 500
# Required-Start: $local_fs
# Default-Start: S
# Short-Description: saves configuration files that were modified during sysinit
### END INIT INFO

. /lib/lsb/init-functions

only start
deny control

start(){

 run(){
  local r=0
  for   d in /media/root/*; do
   [ -d "$d/etc/init.d"        ] || continue
   [ -d "$d/etc/init.d/conf.d" ] || mkdir -m 700 "$d/etc/init.d/conf.d"
   for  f in /etc/init.d/conf.d/*; do
    if   [      "$f" -nt "$d/$f" ]
    then cp -av "$f"     "$d/$f" || r=1
    fi
   done
  done
  return $r
 }

 if   log_warning_msg "/etc/init.d/conf.d checking"; run
 then log_success_msg "/etc/init.d/conf.d checked"
 else log_failure_msg "/etc/init.d/conf.d failed"
 fi
}
