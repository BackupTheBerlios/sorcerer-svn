(

  prepare_install                     &&
  rm   -rf  $BUILD_DIR/old.libraries  &&
  cp   -r   $BUILD_DIR  /usr/lib      &&
  cd  /usr/lib/j2sdk${VERSION}/bin    &&
  for  FILE  in  `ls`;  do
    if  [  -f  $FILE  ];  then
      ln  -sf  /usr/lib/j2sdk${VERSION}/bin/${FILE}  \
                                   /usr/bin/${FILE}
    fi
  done

) > $C_FIFO 2>&1
