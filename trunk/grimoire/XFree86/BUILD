if    [  -f  $CONFIG_LOGS/$BSPELL/host.def  ];  then
  cat        $CONFIG_LOGS/$BSPELL/host.def    |
  sed  "s:BuildXF86DRM YES:BuildXF86DRM NO:"  >  \
                        config/cf/host.def
  (
    echo  "#define DefaultCCOptions       $CFLAGS"
    echo  "#define DefaultGcc2i386Opt     $CFLAGS"
    echo  "#define LibraryCDebugFlags     $CFLAGS"
    echo  "#define DefaultCDebugFlags     $CFLAGS"
    echo  "#define OptimizedCDebugFlags   $CFLAGS"
    if  [  -n  "$LDFLAGS"  ];  then
      echo  "#define LOCAL_LDFLAGS          $LDFLAGS"
    fi
    echo  "#define HasZlib                YES"
    echo  "#define InstallXdmConfig       YES"
    echo  "#define InstallXinitConfig     YES"

    echo  "#define BuildFreeType          NO"

    echo  "#define HasFreetype2           YES"
    echo  "#define BuildFreetype2Library  NO"
    echo  "#define UseFreetype2           YES"
    echo  "#define Freetype2LibDir        /usr/lib"

#    echo  "#define HasFontconfig          YES"
#    echo  "#define UseFontconfig          YES"
#    echo  "#define BuildFontconfigLibrary NO"
#    echo  "#define FontconfigLibDir       /usr/lib"

#    echo  "#define BuildXftLibrary        NO"
#    echo  "#define BuildXft1Library       NO"

     echo  "#define BuildFonts             NO"

  )  >> config/cf/host.def

fi


( 

  echo  "Adding fontconfig-2.1.92"
  cp    -av     fontconfig-2.1.92/*  lib/fontconfig/
  rm    -rf     fontconfig-2.1.92
  sed   -i      "s:@FC_DEFAULT_FONTS@:/usr/X11R6/lib/X11/fonts:"  lib/fontconfig/fonts.conf.in
  sed   -i      "s:@FC_FONTPATH@:<dir>/usr/share/fonts</dir>:"    lib/fontconfig/fonts.conf.in
  sed   -i      "s:@VERSION@:2.1.92:"                             lib/fontconfig/fontconfig.pc.in

  if    spell_installed  "$( get_provider  Linux-PAM  )"
  then  echo  "#define  HasPam  YES"  >>  config/cf/site.def
  fi

  sed  -i  "s:/usr/bin/cpp:cpp:"  config/cf/linux.cf

  make  World                      &&
  prepare_install                  &&
  cd    $BUILD_DIR                 &&
  make  install                    &&
  make  install.man                &&
  mkdir  -p  /usr/X11R6/include/GL


) > $C_FIFO 2>&1  &&  (

  ULP="/usr/lib/pkgconfig"
  [      -d  $ULP  ]  ||
  mkdir  -p  $ULP
  cp     -a  /usr/X11R6/lib/pkgconfig/*  $ULP

  rm     -f  /usr/X11R6/include/zlib.h
  rm     -f  /usr/X11R6/lib/libz.a

  if  [  !  -e                /etc/skel/.xsession  ];  then
    cp  $SCRIPT_DIR/xsession  /etc/skel/.xsession
  fi

  if  [  !  -e                    /usr/bin/X11  ];  then
    ln      -sf   /usr/X11R6/bin  /usr/bin/X11
  fi

  if  [  !  -e          /usr/X11  ];  then
    ln      -sf  X11R6  /usr/X11
  fi

  if  [  !  -e                         /usr/include/X11  ];  then
    ln      -sf  ../X11R6/include/X11  /usr/include/X11
  fi

  if  [  !  -e                     /usr/lib/X11  ];  then
    ln      -sf  ../X11R6/lib/X11  /usr/lib/X11
  fi

)
