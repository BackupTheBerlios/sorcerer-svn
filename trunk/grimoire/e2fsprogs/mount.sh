#!/bin/sh

start_lvm2()  {
  if    [  -x  /usr/sbin/vgscan    ]  &&
        [  -x  /usr/sbin/vgchange  ]
  then  echo  -n  "Activating LVM2..."
        /usr/sbin/vgscan
        /usr/sbin/vgchange -a y
        echo    "done."
  fi
}


start() {

  !  [  -d  /devices  ]  ||  mount   -n  -t  devfs devfs /devices

  mount   -n                  /proc
  mount   -n  -o  remount,ro  /

  echo    -n  "Activating swap... "
  swapon  -a  2> /dev/null
  echo        "done."

  if  !  [  -e  /fastboot  ]; then 

    [  -e  /forcefsck      ]  &&  FORCE="-f"
    [  "$FSCKFIX"  =  yes  ]  &&    FIX="-y"  ||  FIX="-a"

    echo  -n  "Checking file systems... "
    fsck  -C  -A  $FIX  $FORCE

    if [  $?  -gt  1  ];  then
      echo  "fsck failed."
      echo  "Please repair your file system manually by"
      echo  "running /sbin/fsck without the -a option"
      sulogin  -t  120
    fi

  fi

  # remount /  as readwrite, then fake remount to record to /etc/mtab
  echo     "done."
  mount    -n  -o  remount  /
  touch    /etc/mtab
  mount    -f  -o  remount  /
  start_lvm2
  mount    -a
  rm       -f  /fastboot  /forcefsck

}


stop() {

  echo     -n  "Deactivating swap... "
  swapoff  -a
  echo         "done."

  echo     -n  "Unmounting local filesystems... "
  umount   -t  nodevfs,noproc  -f  -a  -r
  echo         "done."

  cat  /etc/mtab  |
  while  read  DEVICE  MOUNT  REST
  do    mount  -n  -o  remount,ro  $MOUNT
  done

  if    !  mount    -n  -o remount,ro  /
  then     echo     "/ failed to remount read only"
           sulogin  -t 300
  fi

}

case "$1" in
  start)  start                           ;;
   stop)  stop                            ;;
      *)  echo  "Usage: $0 {start|stop}"  ;;
esac
