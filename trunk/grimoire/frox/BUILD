install_init()  {

  if    !  [  -f  /etc/init.d/frox.sh  ]
  then  cp        $SCRIPT_DIR/frox.sh  /etc/init.d
  fi

}


sed  -i  "s:# WorkingDir /usr/local/lib/frox:WorkingDir /var/cache/frox:
          s:Listen 192.168.2.1:# Listen 192.168.2.1:
          s:# User nobody:User nobody:
          s:# Group nogroup:Group nobody:"  src/frox.conf

./configure  --build=$BUILD         \
             --prefix=/usr          \
             --sysconfdir=/etc      \
             --localstatedir=/var   \
             --enable-local-cache   \
             --enable-configfile=/etc/frox.conf  \
             $OPTS                  &&
make                                &&
prepare_install                     &&
make    install                     &&
mkdir  -p      /var/cache/frox      &&
chown  nobody  /var/cache/frox
install_init
