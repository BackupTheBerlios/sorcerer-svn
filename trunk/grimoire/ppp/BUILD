grep   -rl   "net/bpf.h"  *  |
while  read  FILE
do     sed   -i  "s:net/bpf.h:pcap-bpf.h:"  $FILE
done

default_build
