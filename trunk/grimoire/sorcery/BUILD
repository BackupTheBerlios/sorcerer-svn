sym_sentinel_check()  {
  if    [  -e  $SENTINEL  ]  &&
        [  -h  $SENTINEL  ]
  then  echo  "$SENTINEL must not be a symbolic link!"
        echo  "Please correct this first and then recast $BSPELL"
        false
  fi
}


sym_sentinel_check  &&
[  -x   install  ]  &&
prepare_install     &&
      ./install  $VERSION
