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

  case  $MACHTYPE  in
    x86_64-pc-linux-gnu)  ASM="asm-x86_64"  ;;
                      *)  ASM="asm-i386"    ;;
  easc

                                       [  -e  /usr/include/asm  ]  ||
  ln  -s  /usr/src/linux/include/$ASM         /usr/include/asm

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


make_modules()  {
  if    grep  -q  "CONFIG_MODULES=y"  .config
  then  make   modules  &&  backup_modules
  fi
}


make_modules_install() {
  if    grep  -q  "CONFIG_MODULES=y"  .config
  then  make   modules_install
  fi
}


compile_and_install()  {
  yes  ""  |  make  oldconfig
  store_config            &&
  make   bzImage          &&
  make_modules            &&
  prepare_install         &&
  make_modules_install    &&
  install_kernel          &&
  install_headers
}


cd  /usr/src/linux-$VERSION
restore_linux_configs  &&
activate_voyeur        &&
compile_and_install    &> $C_FIFO
