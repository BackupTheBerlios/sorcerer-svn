sed  -i  "s:-O2:$CFLAGS:
          s:-static:-static $LDFLAGS:
          s:/usr/bin/gcc:gcc:
          s:/sbin/\$(GRADM_BIN) -P:true:"  Makefile
make             &&
prepare_install  &&
make    install  &&
echo  "Run '/sbin/gradm -P' to set the ACL password."
