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

vfs(){
 sed  's:#.*::' /etc/fstab.rootfs |
 sed  's:\t: :g' | tr  -s ' '     |
 sed  's:^ ::'   | cut -d ' ' -f2 |
 grep /media/root/
}

primary_root(){ vfs | sed '1p;d'; }

start(){

 run(){
  local r=0
         d="$( primary_root )"
  [ -d "$d/etc/init.d"        ] || continue
  [ -d "$d/etc/init.d/conf.d" ] || mkdir -m 700 "$d/etc/init.d/conf.d"
  for  f in /etc/init.d/conf.d/*; do
   if   [      "$f" -nt "$d/$f" ]
   then cp -av "$f"     "$d/$f" || r=1
   fi
  done
  return $r
 }

 if   log_warning_msg "/etc/init.d/conf.d checking"; run
 then log_success_msg "/etc/init.d/conf.d checked"
 else log_failure_msg "/etc/init.d/conf.d failed"
 fi
}
