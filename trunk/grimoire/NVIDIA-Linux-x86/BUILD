install_libs()  {

  cd  $BUILD_DIR/usr

  if    /lib/libc.so.6   |
        grep  -q  "Thread-local storage"
  then  cp    -a   X11R6/lib/modules/extensions/tls/*  \
                   X11R6/lib/modules/extentions
  fi

  GB="ltmain.sh - GNU libtool 1.5 (1.1220 2003/04/05 19:32:58)"
  sed  -i  "s:__LIBGL_PATH__:/usr/lib:
            s,__GENERATED_BY__,$GB,"    lib/libGL.la

  /sbin/ldconfig  -n  lib  lib/tls   \
                         X11R6/lib   \
                         X11R6/lib/modules/extensions

  ln  -s  libGL.so.1      lib/libGL.so
  ln  -s  libGLcore.so.1  lib/libGLcore.so
  ln  -s  libGL.so.1      lib/tls/libGL.so
  ln  -s  libGLcore.so.1  lib/tls/libGLcore.so
   

  rm  -f  /usr/X11R6/lib/libGL.so*
  rm  -f  /usr/lib/libGL.so*
# rm  -f  /usr/lib/libGLU.so*
  rm  -f  /usr/X11R6/lib/modules/extentions/libglx.*
  rm  -f  /usr/X11R6/lib/modules/extentions/libGLcore.*
  rm  -f  /usr/X11R6/lib/libGL.a
# rm  -f  /usr/X11R6/lib/libGLU.a

  cp  -a   lib  X11R6  /usr/                2>/dev/null
  cp  -a   include/GL  /usr/X11R6/include/  2>/dev/null
  cp  -a   share/doc  ..                    2>/dev/null
  cp  -a   include    ../doc                2>/dev/null
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
  true
}

chown  -R  root:root  *
cd  usr/src/nv

rm  -f  makefile         Makefile
cp      Makefile.nvidia  Makefile

if  LVER=$(  installed_version  $(  get_provider  linux-kernel  )  )
then
   SM="/usr/src/linux/System.map"
  SSC="suser-sanity-check"
  RSC="rmmod-sanity-check"

  sed  -i  "s/\$(shell uname -r)/$LVER/"  Makefile
  sed  -i  "s:depmod:true:"               Makefile
  sed  -i  "s:modprobe:true:"             Makefile
  sed  -i  "s:$SSC $RSC:$SSC:"            Makefile
#  sed  -i  "s: rmmod-check::"             Makefile
#  sed  -i  "s:sh conftest.sh rmmod:true :"   Makefile

else
  echo  "linux-kernel is not detected as installed."
  echo  "Please cast linux before casting this spell."
  false
fi  &&

prepare_install                        &&
make    install  IGNORE_CC_MISMATCH=1  &&
install_libs                           &&
make_device_nodes
