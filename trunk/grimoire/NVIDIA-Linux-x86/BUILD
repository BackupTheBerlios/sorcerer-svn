(

  install_libs()  {

    cd  $BUILD_DIR/usr

    if    /lib/libc.so.6   |
          grep  -q  "Thread-local storage"
    then  cp    -a   X11R6/lib/modules/extensions/tls/*  \
                     X11R6/lib/modules/extentions
    fi

    /sbin/ldconfig  -n  lib  lib/tls   \
                           X11R6/lib   \
                           X11R6/lib/modules/extensions

    ln  -s  libGL.so.1      lib/libGL.so
    ln  -s  libGLcore.so.1  lib/libGLcore.so
    ln  -s  libGL.so.1      lib/tls/libGL.so
    ln  -s  libGLcore.so.1  lib/tls/libGLcore.so
   

    rm  -f  /usr/X11R6/lib/libGL.so*
    rm  -f  /usr/X11R6/lib/GLU.so*
    rm  -f  /usr/lib/libGL.so*
    rm  -f  /usr/lib/libGLU.so*
    rm  -f  /usr/X11R6/lib/modules/extentions/libglx.*
    rm  -f  /usr/X11R6/lib/modules/extentions/libGLcore.*

    cp  -av  lib  X11R6  /usr/
    cp  -a   share/doc  ..
    cp  -a   include    ../doc

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
  sed  -i  "s:/sbin/rmmod nvidia:true:"     Makefile
  sed  -i  "s:/sbin/rmmod NVdriver:true:"   Makefile
  sed  -i  "s:/sbin/modprobe nvidia:true:"  Makefile
  sed  -i  "s:depmod -a:depmod -a -q -F /usr/src/linux/System.map:"  Makefile

  if  spell_installed  linux;  then
    VERSION=$(  installed_version  linux  )
    sed  -i  "s/\$(shell uname -r)/$VERSION/"  Makefile
  fi

  sed  -i  "s/: gcc-check/:/"  Makefile

  make             IGNORE_CC_MISMATCH=1  &&
  prepare_install                        &&
  make    install  IGNORE_CC_MISMATCH=1  &&
  install_libs                           &&
  make_device_nodes

) > $C_FIFO 2>&1
