init_install()  {
  install  -m 0744  $SCRIPT_DIR/sysfsmount.sh  /etc/init.d
  install  -m 0744  extras/start_udev          /etc/init.d
  ln       -fs      ../init.d/start_udev       /etc/rcS.d/S05udev
  ln       -fs      ../init.d/sysfsmount.sh    /etc/rcS.d/S00sysfsmount
  install  -m 0444  etc/udev/udev.permissions.gentoo  /etc/udev/permissions.d/gentoo.permissions
  install  -m 0444  etc/udev/udev.rules.gentoo        /etc/udev/rules.d/gentoo.rules
}


example_install()  {
  mkdir  -p                    /etc/udev/example
  for  FILE  in                 etc/udev/*
  do   install -m 0444  $FILE  /etc/udev/example
  done
}


linux_sufficient()  {

  local  KVER

  KVER="$(  installed_version  $(  get_provider  linux-kernel  )  )"
  
  if    [  "${KVER:0:3}"  ==  "2.4"  ]
  then  "Linux 2.4 is insufficient for using udev as /dev"
        false
  elif  !  grep  -q  "CONFIG_HOTPLUG=y"  /usr/src/linux/.config
  then  echo  "Linux must have CONFIG_HOTPLUG enabled when it was built."
        false
  fi

}


sed  -i  "s:/local::;s:^udevdir = .*:udevdir = /dev:"  Makefile

linux_sufficient            &&
make                        &&
prepare_install             &&
make    install  DESTDIR=/  &&
example_install             &&
   init_install
