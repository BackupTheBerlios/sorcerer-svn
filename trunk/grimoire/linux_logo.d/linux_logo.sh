#!/bin/sh

# change this line according to your likeness ;)
# check linux_logo's man page for details.

OPTS="-L 3 -f" 

rm  -f  /etc/{issue,issue.net}
/usr/bin/linux_logo  ${OPTS}  >  /etc/issue
cp  -f  /etc/issue  /etc/issue.net
