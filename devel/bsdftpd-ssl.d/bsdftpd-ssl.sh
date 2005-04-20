#!/bin/sh
FTPD="ftpd"

case $1 in
	start|restart)  echo   "$1ing bsdftpd-ssl, ftp daemon."
			pkill  "^ftpd$"  &&  sleep  5
			$FTPD
			;;
	stop)  echo   "$1ping bsdftpd-ssl"
			pkill  "^ftpd$"  
			;;
  *)  echo   "Usage: $0 {start|stop|restart}"
		;;
esac
