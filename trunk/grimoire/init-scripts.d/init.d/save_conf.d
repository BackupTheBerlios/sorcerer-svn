#!/bin/bash

### BEGIN INIT INFO
# Default-Mode: 500
# Required-Start: $local_fs
# Default-Start: S
# Short-Description: saves configuration files that were modified during sysinit
### END INIT INFO

rootfs || exit 0

. /lib/lsb/init-functions

only start
deny control

parent_root(){
 local d f r

 if   ! [ -f     /etc/rootname ]; then return 1
 elif ! read r < /etc/rootname  ; then return 1
 fi

 for d in /media/root/*; do
  if   [   -f   "$d/etc/rootname" ] &&
       read f < "$d/etc/rootname"   &&
       [  "$f" == "$r" ]
  then D="$d"; return 0
  fi
 done

 return 1
}

files_copy(){
 [ -d "$D/etc/init.d/conf.d" ] || mkdir -m 700 "$D/etc/init.d/conf.d"

 for  f in /etc/init.d/conf.d/*; do
  if   [      "$f" -nt "$D/$f" ]
  then cp -av "$f"     "$D/$f" || r=1
  fi
 done

 return $r
}

start(){
 if   log_warning_msg "parent root file system locating"; parent_root
 then log_success_msg "parent root file system found"
 else log_failure_msg "parent root file system unknown"; return 1
 fi

 if   log_warning_msg "{,$D}/etc/init.d/conf.d/ newer files copying"; files_copy
 then log_success_msg "{,$D}/etc/init.d/conf.d/ newer files copied"
 else log_failrue_msg "{,$D}/etc/init.d/conf.d/ newer files copy failure"; return 1
 fi
}
