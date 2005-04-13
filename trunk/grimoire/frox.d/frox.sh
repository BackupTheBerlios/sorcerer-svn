#!/bin/sh


redirect()  {
  modprobe  ip_nat_ftp  2>/dev/null
  echo  1  >  /proc/sys/net/ipv4/ip_forward
  # the line below will definitely require adjusting.
  iptables -t nat -A PREROUTING -p tcp -s localnet --dport 21 -j REDIRECT --to 2121
}


stop()  {
  if    [  -f        /var/run/frox.pid  ]
  then  PID=$(  cat  /var/run/frox.pid  )
        rm  -f       /var/run/frox.pid
        kill  -15  $PID
        true
  else  false
  fi
}


restart()  {
  if    stop
  then
    echo  "Restarting frox."
    sleep 1
    frox
  else
    echo  "frox is not running."
  fi
}


case "$1" in
  start)
    echo  "$1ing frox"
    frox
    redirect  ;;

  restart)  restart  ;;

  stop)
    echo   "$1ping frox"
    stop  ;;

  *)
    echo  "Usage: $0 {start|stop|reload|restart}"
    exit  1
esac
