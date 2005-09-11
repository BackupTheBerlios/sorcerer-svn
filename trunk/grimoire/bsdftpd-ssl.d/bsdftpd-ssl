#!/bin/sh

### BEGIN INIT INFO
# Provides: $network
# Required-Start: $network
# Required-Stop:  $network
# Default-Start: 3 4 5
# Default-Stop:  0 1 2 6
# Short-Description: run bsdftp-ssl ftp server
# Description:  run bsdftp-ssl ftp server
### END INIT INFO


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
