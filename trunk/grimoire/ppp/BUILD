case  $VERSION  in
  2.4.2)  sed  -i  "s:rp-pppoe::"  pppd/Makefile.linux  ;;
esac

grep   -rl   "net/bpf.h"  *  |
while  read  FILE
do     sed   -i  "s:net/bpf.h:pcap-bpf.h:"  $FILE
done


./configure  --build=$BUILD          \
             --prefix=/usr           \
             --sysconfdir=/etc       \
             --localstatedir=/var    &&
make             $OPTS               &&
prepare_install                      &&
make    install  $OPTS
