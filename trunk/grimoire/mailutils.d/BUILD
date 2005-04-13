UBM="/usr/bin/mail"
UBMX=${UBM}x


case  $VERSION  in
  0.6)  sed  -i  "\,extern int,d"  mailbox/getline.h  ;;
esac

./configure  --build=$BUILD         \
             --prefix=/usr          \
             --sysconfdir=/etc      \
             --localstatedir=/var   \
             $OPTS                  &&
make                                &&
prepare_install                     &&
rm     -f  $UBM  $UBMX              &&
make    install                     &&
ln     -s  mail  $UBMX
