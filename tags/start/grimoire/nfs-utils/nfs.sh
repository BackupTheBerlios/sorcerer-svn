#!/bin/sh

[  -e /etc/exports  ]  ||  exit 0

NUMSERVERS=8
MOUNTDOPTS=

case $1 in
   start|restart)  echo "$1ing NFS services"
                   exportfs -r 

                   pkill      "^rpc.rquotad$"  &&  sleep  5
                   pkill      "^rpc.mountd$"   &&  sleep  5
                   pkill  -1  "^nfsd$"         &&  sleep  5
                   pkill      "^rpc.statd$"    &&  sleep  5

                   ps  -C  portmap  >  /dev/null  ||
                   /usr/sbin/portmap
                   /usr/sbin/rpc.rquotad
                   /usr/sbin/rpc.mountd  $MOUNTDOPTS
                   /usr/sbin/rpc.nfsd    $NUMSERVERS
                   /usr/sbin/rpc.statd
                   ;;

            stop)  echo "$1ping NFS services"
                   /usr/sbin/exportfs -au
    
                   pkill      "^rpc.rquotad$"
                   pkill      "^rpc.mountd$"
                   pkill  -1  "^nfsd$"
                   pkill      "^rpc.statd$"
                   ;;

               *)  echo "Usage: $0 {start|stop|restart}"
                   ;;
esac
