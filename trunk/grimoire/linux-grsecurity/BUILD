backup_modules()  {

  if    [  -d  /lib/modules/$VERSION      ];  then
    rm   -rf   /lib/modules/$VERSION.old
    mv         /lib/modules/$VERSION      \
               /lib/modules/$VERSION.old
  fi

}


store_config()  {  cp  .config  $CONFIG_LOGS/$BSPELL/linux-config;  }


install_kernel()  {

  SM="System.map"
  BV="${VERSION}"
  BZ=$(  find  .  -name  bzImage  )

  rm     -rf                  /boot/$BV
  mkdir  -p                   /boot/$BV
  cp          $BZ             /boot/$BV/linux
  cp              System.map  /boot/$BV
  rm     -f                   /boot/System.map
  ln     -s   $BV/System.map  /boot/System.map

}


run_make_menuconfig()  {

  wiz_kill

  CONFIG_KERNEL="true"
  while  $CONFIG_KERNEL; do
    make  menuconfig
    if    query  "Repeat menuconfig?" n
    then  CONFIG_KERNEL=true
    else  CONFIG_KERNEL=false
    fi
  done
}


symlink_headers()  {

                                       [  -e  /usr/include/asm  ]  ||
  ln  -s  /usr/src/linux/include/asm-i386     /usr/include/asm

                                       [  -e  /usr/include/asm-generic  ]  ||
  ln  -s  /usr/src/linux/include/asm-generic  /usr/include/asm-generic

                                       [  -e  /usr/include/linux  ]  ||
  ln  -s  /usr/src/linux/include/linux        /usr/include/linux

}


restore_linux_configs()  {

  CURRENT="$CONFIG_LOGS/$BSPELL/linux-config"
      OLD="$CONFIG_LOGS/$BSPELL/linux-config.old"
    LINUX="/usr/src/linux-$VERSION/.config"

  symlink_headers

  if    [  -f   $CURRENT  ];  then  cp  $CURRENT  $LINUX
  elif  [  -f   $OLD      ];  then  cp  $OLD      $LINUX;  run_make_menuconfig
  else  run_make_menuconfig
  fi

}


install_headers()  {

  install_header_dir()  {
    if    [   -h   /usr/include/$1  ]
    then  rm  -f   /usr/include/$1
    elif  [   -d   /usr/include/$1  ]
    then  rm  -rf  /usr/include/$1
    fi

    mkdir  -p   /usr/include/$1
    cp     -R        include/$1/*   \
                /usr/include/$1
  }

  install_header_dir  asm
  install_header_dir  asm-generic
  install_header_dir  linux
  true

}


remove_extraversion()  {

  sed  -i  "s:EXTRAVERSION = .*:EXTRAVERSION =:"  Makefile

}


compile_and_install()  {
  yes  ""  |  make  oldconfig
  store_config            &&
  make   bzImage          &&
  make   modules          &&
  backup_modules          &&
  prepare_install         &&
  make   modules_install  &&
  install_kernel          &&
  install_headers
}


apply_grsecurity_patch()  {
  cat         $(  guess_filename  ${SOURCE[1]}  )  |  patch  -p1
  sed  -i  "s:EXTRAVERSION = .*:EXTRAVERSION =:"  Makefile
  echo "Applied ${SOURCE[1]}"
}


cd  /usr/src/linux-$VERSION
apply_grsecurity_patch
restore_linux_configs  &&
activate_voyeur        &&
compile_and_install    &> $C_FIFO
