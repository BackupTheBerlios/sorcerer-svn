init_install()  {
  install  -m 0744  $SCRIPT_DIR/sysfsmount.sh  /etc/init.d
  install  -m 0744  extras/start_udev          /etc/init.d
  ln       -fs      ../init.d/start_udev       /etc/rcS.d/S05udev
  ln       -fs      ../init.d/sysfsmount.sh    /etc/rcS.d/S00sysfsmount
  install  -m 0444  etc/udev/udev.permissions.gentoo  /etc/udev/permissions.d/gentoo.permissions
  install  -m 0444  etc/udev/udev.rules.gentoo        /etc/udev/rules.d/gentoo.rules
  mkdir    -p                                         /etc/udev/scripts
  install  -m 0755  extras/ide-devfs.sh               /etc/udev/scripts
  install  -m 0755  extras/scsi-devfs.sh              /etc/udev/scripts
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
  elif                            [  -f  /usr/src/linux/.config  ]  &&
        !  grep  -q  "CONFIG_HOTPLUG=y"  /usr/src/linux/.config
  then  echo  "Linux must have CONFIG_HOTPLUG enabled when it was built."
        false
  fi

}


sed  -i  "s:/local::
          s:^udevdir = .*:udevdir = /dev:
          s:killall:true:"  Makefile
sed  -i  "s:@udevdir@:/dev:"  etc/udev/udev.conf.in
echo     "Configuration fixed so udev mounts on /dev."

linux_sufficient  &&
make              &&
prepare_install   &&
make    install   &&
example_install   &&
   init_install
