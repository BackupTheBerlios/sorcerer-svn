finish_install()  {


  if    [  "$KDC"  ==  "y"  ]
  then  cp  $SCRIPT_DIR/krb5.sh        /etc/init.d/
        ln  -sf  ../init.d/krb5.sh     /etc/rc3.d/S40krb5
        ln  -sf  ../init.d/krb5.sh     /etc/rc4.d/S40krb5
        ln  -sf  ../init.d/krb5.sh     /etc/rc5.d/S40krb5

        ln  -sf  ../init.d/krb5.sh     /etc/rc0.d/K60krb5
        ln  -sf  ../init.d/krb5.sh     /etc/rc1.d/K60krb5
        ln  -sf  ../init.d/krb5.sh     /etc/rc2.d/K60krb5
        ln  -sf  ../init.d/krb5.sh     /etc/rc6.d/K60krb5
  fi

  if    [  "$MASTER"  ==  "y"  ]
  then  sed  -i  "s:# /usr:/usr:"  /etc/init.d/krb5.sh
  fi

  if    !  [  -f    /etc/krb5.conf  ]
  then  cp  config-files/krb5.conf  /etc
  fi

  if    !  [  -f  /etc/kdc.conf  ]
  then  sed  -i  "s:local/::g"  config-files/kdc.conf
        cp   config-files/kdc.conf  /etc/init.d/
  fi

}

if    [  -f  krb5-$VERSION.tar.gz  ];  then
  tar  -zxf  krb5-$VERSION.tar.gz
  cd         krb5-$VERSION
fi

  cd  src

  sed  -i  "1i#include <errno.h>"  include/krb5/k5-config.h
  sed  -i  "1i#include <errno.h>"  include/kerberosIV/krb.h
  sed  -i  "1i#include <errno.h>"  util/ss/ss.h

  case  $VERSION  in
    1.2.7)  patch  <  $(  guess_filename  ${SOURCE[1]}  )  \
                   lib/rpc/xdr_mem.c
            bzcat  $SCRIPT_DIR/patch.1.2.7.bz2  |
            patch  -p0  ;;
  esac

  ./configure  --enable-dns-for-kdc    \
               --enable-dns-for-realm  \
               --prefix=/usr           \
               $OPTS                   &&
  make                                 &&
  prepare_install                      &&
  make    install                      &&
   finish_install
