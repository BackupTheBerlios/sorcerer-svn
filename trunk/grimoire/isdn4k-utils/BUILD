store_config()  {
  mkdir  -p    $CONFIG_LOGS/$SPELL
  cp  .config  $CONFIG_LOGS/$SPELL
}


restore_config()  {
  if    [  -f  $CONFIG_LOGS/$SPELL/.config  ]
  then  cp     $CONFIG_LOGS/$SPELL/.config  .
  fi
}


make_menuconfig()  {

  restore_config

  if    wiz_running
  then  kill  -15  $(  cat  $WIZ_PID;  rm  -f  $WIZ_PID  )
        sleep  1
  fi

  while  $CONFIG_ISDN;  do
    make  testconfig
    if    query  "Repeat  config?"  n
    then  CONFIG_ISDN="true"
    else  CONFIG_ISDN="false"
    fi
  done

}


make_install()  {

  yes   ""         |
  make  subconfig  &&
  store_config     &&
  make             &&
  prepare_install  &&
  make    install

}


# patch  -p0  <  $SCRIPT_DIR/isdn4k-utils-v3.1pre1.patch
make_menuconfig  &&
activate_voyeur  &&
make_install  &>  $C_FIFO
