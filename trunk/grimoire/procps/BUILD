selinux_patches()  {
  SCX=1
  while  [  -n                    "${SOURCE[$SCX]}"    ]
  do     zcat  $(  guess_filename  ${SOURCE[$SCX]}  )  |
         patch  -p1
         ((  SCX++  ))
  done
  patch  -p1  <  $SCRIPT_DIR/procps-selinux.patch
}


case  $BRANCH  in
  selinux)  selinux_patches  ;;
esac


LD="-Wl,-warn-common"

sed  -i  "s:-O2 -g3:$CFLAGS:
          s:$LD:$LD $LDFLAGS:"  Makefile
make  &&
make  install  -e  XSCPT=''  DESTDIR=      &&
cp  $SCRIPT_DIR/sysctl.sh     /etc/init.d  &&
ln  -sf  ../init.d/sysctl.sh  /etc/rcS.d/S99sysctl
