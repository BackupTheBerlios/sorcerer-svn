#!/bin/sh


run()  {
  if    [  -x  $1  ]
  then  $1  $2
  fi
}


block()  {
  run  /usr/sbin/courierfilter           $1
  run  /usr/libexec/authlib/authdaemond  $1
  run  /usr/sbin/courierldapaliasd       $1
  run  /usr/libexec/courier/pcpd         $1
  run  /usr/sbin/courier                 $1
  run  /usr/sbin/esmtpd                  $1
  run  /usr/sbin/esmtpd-msa              $1
}  

case  $1  in
    start)  echo  "Starting Courier MTA";  block  start  ;;
     stop)  echo  "Stopping Courier MTA";  block  stop   ;;
  restart)  $0     stop;  $0  start                      ;;
        *)  echo  "Usage: $0 {start|stop|restart}"       ;;
esac
