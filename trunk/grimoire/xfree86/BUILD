if    [  -f  $CONFIG_LOGS/$SPELL/host.def  ]
then  sed  "s:BuildXF86DRM YES:BuildXF86DRM NO:"  \
           $CONFIG_LOGS/$SPELL/host.def           \
           >         config/cf/host.def
fi


( 

  echo  "If you use DRM, then enable it within linux, not xfree86."
  sleep  3
  echo  "#define  InstallXdmConfig    YES"  >>  config/cf/site.def
  echo  "#define  InstallXinitConfig  YES"  >>  config/cf/site.def

  if  spell_installed  Linux-PAM
  then  echo  "#define  HasPam  YES"  >>  config/cf/site.def
  fi

  patch  -p1  <  $(  guess_filename  ${SOURCE[3]}  )
  patch  -p1  <  $(  guess_filename  ${SOURCE[4]}  )
  patch  -p1  <  $(  guess_filename  ${SOURCE[5]}  )

  make  World                      &&
  prepare_install                  &&
  cd    $BUILD_DIR                 &&
  make  install                    &&
  make  install.man                &&
  mkdir  -p  /usr/X11R6/include/GL


) > $C_FIFO 2>&1  &&  (

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
