(

  DEST_DIR="/opt/j2sdk/$VERSION"

  prepare_install                         &&
  mkdir  -p                $DEST_DIR      &&
  cp     -r  $BUILD_DIR/*  $DEST_DIR      &&
  cd                       $DEST_DIR/bin  &&
  for  FILE  in  *;  do
    if      [  -f    $FILE  ]  &&
            [  -x    $FILE  ]
    then    ln  -sf  $DEST_DIR/bin/${FILE}  \
                          /usr/bin/${FILE}
    fi
  done

) > $C_FIFO 2>&1
