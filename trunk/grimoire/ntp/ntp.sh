#!/bin/bash

PID_FILE=/var/run/ntpd.pid

ntpd_not_running()  {
  if    !  [  -f  $PID_FILE  ]
  then  echo  "ntpd is already running"
  elif  !  /bin/ps $(< $PID_FILE )  |  grep  -q  "ntpd"
  then  echo  "ntpd is already running"
  else  false
  fi
}


ntpd_conf_present()  {  
  if  !  [  -f  /etc/ntp.conf  ]
  then  echo   "/etc/ntp.conf not found.  Start aborted."
        false
  fi
}


start()  {
  if    ntpd_not_running  &&
        ntpd_conf_present
  then
    echo  -n  "Starting ntpd..."
    /usr/bin/ntpd  -c /etc/ntp.conf  -p $PID_FILE
    echo  "done."
  fi
}


stop()  {
  if    ntpd_not_running
  then  echo  "ntpd is not running."
  else
    echo  -n  "Stopping ntpd..."
    [     -f        $PID_FILE  ]  &&
    kill  -15  $(<  $PID_FILE  )
    echo  "done."
  fi
}


help()  {  echo   "Usage: $0 {start|stop|restart}";  }


case  $1  in
    start)                       start  ;;
  restart)  stop  &&  sleep  1;  start  ;;
     stop)  stop                        ;;
        *)  help                        ;;
esac
