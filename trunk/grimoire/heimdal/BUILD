sed  -i  "s:db, fn, NULL,:db, NULL, fn, NULL,:
          s:db, db->name, NULL,:db, NULL, db->name, NULL,:"  \
     lib/hdb/db3.c

sed  -i  "s:db, fn, NULL,:db, NULL, fn, NULL,:"  \
     lib/roken/ndbm_wrap.c

LOG="
[logging]
	kdc = FILE:/var/heimdal/kdc.log
	kdc = SYSLOG:INFO
	default = SYSLOG:INFO:USER
"

default_build  &&

if    !  [  -f      /etc/krb5.conf  ];  then
  cp    krb5.conf   /etc/krb5.conf
  echo  "$LOG"  >>  /etc/krb5.conf
fi
