(
  
  DEST="/usr/X11R6/lib/X11/fonts/TrueType"

  if    [  -f  Licen.TXT  ];  then
    prepare_install
    mkdir  -p  $DEST
    for   FONT  in  *.exe
    do    cabextract  -L $FONT  -d $DEST
    done
    rm     -rf   $DEST/{*.dll,*.inf,*.exe,*.txt}
    mkfontscale  $DEST
    cp           $DEST/fonts.scale  \
                 $DEST/fonts.dir
    mkdir             doc
    mv     Licen.TXT  doc
  else  false
  fi

) > $C_FIFO 2>&1
