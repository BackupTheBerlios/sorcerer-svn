store_config()  {
  mkdir  -p    $CONFIG_LOGS/$SPELL
  cp  .config  $CONFIG_LOGS/$SPELL
}

restore_config()  {
  if    [  -f  $CONFIG_LOGS/$SPELL/.config  ]
  then  cp     $CONFIG_LOGS/$SPELL/.config  .
  fi
}

restore_config

while  $CONFIG_ISDN;  do
  make  config
  if    query  "Repeat  config?"  n
  then  CONFIG_ISDN="true"
  else  CONFIG_ISDN="false"
  fi
done


(
  patch  -p0  <  $SCRIPT_DIR/isdn4k-utils-v3.1pre1.patch
  make  subconfig  &&
  store_config     &&
  make             &&
  prepare_install  &&
  make    install

) > $C_FIFO 2>&1
