if    [  -f  $CONFIG_LOGS/$SPELL/makefile.unix  ]
then  cp     $CONFIG_LOGS/$SPELL/makefile.unix  .
else
  EDIT_MAKEFILE="true"
  while  $EDIT_MAKEFILE;  do
    ${EDITOR:-nano}  makefile.unix
    if    query  "Repeat  edit"  n
    then  EDIT_MAKEFILE="true"
    else  EDIT_MAKEFILE="false"
    fi
  done
fi

activate_voyeur
(
  mkdir  -p          $CONFIG_LOGS/$SPELL
  cp  makefile.unix  $CONFIG_LOGS/$SPELL

  patch  -p1  <  $SCRIPT_DIR/xmame.int.fix

  case  $VERSION  in
    0.74.1) sed  -i  's:GLXLIB_NAME:"libglx.so":'  src/unix/video-drivers/gltool.c  ;;
    0.77.1) sed  -i  's:GLXLIB_NAME:"libglx.so":'  src/unix/video-drivers/gltool.c  ;;
    0.78.1) sed  -i  's:GLXLIB_NAME:"libglx.so":'  src/unix/video-drivers/gltool.c  ;;
    0.79.1) sed  -i  's:GLXLIB_NAME:"libglx.so":'  src/unix/video-drivers/gltool.c  ;;
#   0.84.1) sed  -i  's:GLXLIB_NAME:"libglx.so":'  src/unix/video-drivers/gltool.c  ;;
      0.87) sed  -i  's:GLXLIB_NAME:"libglx.so":'  src/unix/video-drivers/gltool.c  ;;
  esac

  grep -q "CRLF"  makefile.unix || sed -i "1iCRLF = 2"        makefile.unix
  grep -q "EXPAT" makefile.unix || sed -i "1iBUILD_EXPAT = 1" makefile.unix

  make           PREFIX=/usr           \
                 BINDIR=/usr/games     \
                 CFLAGS="$CFLAGS"      \
                 CXXFLAGS="$CXXFLAGS"  \
                 -f  makefile.unix     &&
  make  install  PREFIX=/usr           \
                 BINDIR=/usr/games     \
                 -f  makefile.unix

) &> $C_FIFO
