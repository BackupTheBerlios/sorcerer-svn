( 

  mkdir  -p  /usr/X11R6/lib/modules/drivers
  mkdir  -p  /usr/X11R6/lib/modules/extensions
  mkdir  -p  /usr/X11R6/include/GL

  prepare_install                              &&
  make    install                              &&
  cp    -d  /usr/lib/libGL*   /usr/X11R6/lib

  # Are the header files worth installing or do they cause problems?
  #   &&
  #  cp    -a  usr/include/GL/*  /usr/include/GL

  X11_PRO="$(  get_provider  x11  )"
  TMP_LOG="/tmp/$X11_PRO.$$.$RANDOM"

  cat  $INSTALL_LOGS/$X11_PRO                                |
  grep  -v  "/usr/X11R6/lib/libGL.a"                         |
  grep  -v  "/usr/X11R6/lib/libGL.so.1.2"                    |
  grep  -v  "/usr/X11R6/lib/modules/extensions/libGLcore.a"  |
  grep  -v  "/usr/X11R6/lib/modules/extensions/libglx.a"     \
    > $TMP_LOG
  mv  $TMP_LOG  $INSTALL_LOGS/$X11_PRO

) > $C_FIFO 2>&1
