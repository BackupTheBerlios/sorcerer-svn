#!/bin/bash

### BEGIN INIT INFO
# Default-Mode: 500
# Required-Start: $local_fs
# Should-Start: wpa_supplicant
# Default-Start: S
# Short-Description: saves configuration files that were modified during sysinit
### END INIT INFO

. /lib/lsb/init-functions

if ! rootfs; then trap - EXIT; exit 0; fi

only start
deny control

origin_root(){
 if   ! [ -f     /etc/origin ] ||
      ! read r < /etc/origin
 then return 1
 fi

 D="$( /bin/grep -lsx "$r" /+/*/etc/{host,root}name | /bin/sed 's:/etc/.*::' )"
 [ -n "$D" ]
}

files_copy(){
 [ -d "$D/etc/init.d/conf.d" ] || mkdir -m 700 "$D/etc/init.d/conf.d"

 local r=0

 for  f in /etc/init.d/conf.d/*; do
  if   [      "$f" -nt "$D/$f" ]
  then cp -av "$f"     "$D/$f" || r=1
  fi
 done

 return $r
}

start(){
 if   log_warning_msg "origin root file system locate"; origin_root
 then log_success_msg "origin root file system locate"
 else log_failure_msg "origin root file system locate"; return 1
 fi

 if   log_warning_msg "{,$D}/etc/init.d/conf.d/ newer files copy"; files_copy
 then log_success_msg "{,$D}/etc/init.d/conf.d/ newer files copy"
 else log_failrue_msg "{,$D}/etc/init.d/conf.d/ newer files copy"; return 1
 fi
}
