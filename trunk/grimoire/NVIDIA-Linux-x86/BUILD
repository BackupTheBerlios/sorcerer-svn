install_libs()  {
  cd  $BUILD_DIR/usr

  if    /lib/libc.so.6   |
        grep  -q  "Thread-local storage"
  then  cp    -a   lib/tls/*  lib
  fi

  GB="ltmain.sh - GNU libtool 1.5 (1.1220 2003/04/05 19:32:58)"
  sed  -i  "s:__LIBGL_PATH__:/usr/lib:
            s,__GENERATED_BY__,$GB,"    lib/libGL.la

  /sbin/ldconfig  -n  lib        \
                      X11R6/lib  \
                      X11R6/lib/modules/extensions

  ln  -s  libGL.so.1      lib/libGL.so
  ln  -s  libGLcore.so.1  lib/libGLcore.so
  ln  -s  libGL.so.1      lib/tls/libGL.so
  ln  -s  libGLcore.so.1  lib/tls/libGLcore.so
   

  rm  -f  /usr/X11R6/lib/libGL.*
  rm  -f  /usr/lib/libGL.*
  rm  -f  /usr/X11R6/lib/modules/extensions/libglx.*
  rm  -f  /usr/X11R6/lib/modules/extensions/libGLcore.*

  cp  -a   lib  X11R6  /usr/                2>/dev/null
  cp  -a   include/GL  /usr/X11R6/include/  2>/dev/null
  cp  -a   share/doc  ..                    2>/dev/null
  cp  -a   include    ../doc                2>/dev/null
  install  -m 0755  bin/nvidia-settings  /usr/bin
}


make_device_nodes()  {
  for  ((CX=0;CX<8;CX++));  do
    NODE="/dev/nvidia$CX"
    rm     -f    $NODE
    mknod        $NODE  c  195  $CX
    chmod  0666  $NODE
  done
  NODE="/dev/nvidiactl"
  rm     -f    $NODE
  mknod        $NODE  c  195  255
  chmod  0666  $NODE
  install  -m 0744  $SCRIPT_DIR/nvidia.sh  /etc/init.d/
  ln       -sf      /etc/init.d/nvidia.sh  /etc/rc5.d/S99nvidia
  true
}

LVER=$(  installed_version  $(  get_provider  linux-kernel  )  )

if    [  -z  "$LVER"  ]
then           LVER=$(  uname  -r  )
fi

chown  -R  root:root  *
cd  usr/src/nv

rm  -f  makefile         Makefile

case  $LVER  in
  2.4*)  cp  Makefile.nvidia  Makefile  ;;
     *)  cp  Makefile.kbuild  Makefile  ;;
esac


   SM="/usr/src/linux/System.map"
  SSC="suser-sanity-check"
  RSC="rmmod-sanity-check"

  sed  -i  "s/\$(shell uname -r)/$LVER/"  Makefile
  sed  -i  "s:depmod:true:"               Makefile
  sed  -i  "s:modprobe:true:"             Makefile
  sed  -i  "s:$SSC $RSC:$SSC:"            Makefile
  sed  -i  "s:install rmmod-sanity-check:install:"    Makefile
#  sed  -i  "s: rmmod-check::"             Makefile
#  sed  -i  "s:sh conftest.sh rmmod:true :"   Makefile


prepare_install                        &&
make    install  IGNORE_CC_MISMATCH=1  &&
install_libs                           &&
make_device_nodes
