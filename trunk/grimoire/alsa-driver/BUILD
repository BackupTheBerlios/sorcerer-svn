mconf()  {

  cat  <<  EOF

options	snd	device_gid=29 device_mode=0660 cards_limit=1

alias	char-major-116		snd
alias	char-major-14		soundcore

alias	snd-card-0		snd-$CARD
alias	sound-slot-0		snd-card-0

alias	sound-service-0-0	snd-mixer-oss
alias	sound-service-0-1	snd-seq-oss
alias	sound-service-0-3	snd-pcm-oss
alias	sound-service-0-8	snd-seq-oss
alias	sound-service-0-12	snd-pcm-oss

# post-install	snd-card-0	/usr/sbin/alsactl  restore
EOF

}


remove_old_modules()  {

  LINUX_VER=$(  installed_version  $(  get_provider  linux  )  )
  rm  -rf  /lib/modules/$LINUX_VER/kernel/sound/acore

}


case  $VERSION  in
  0.9.0rc3)  rm  include/linux/isapnp.h  ;;
         *)  case  $CARD  in
               via686|via8233)  CARD="via82xx"  ;;
             esac  ;;
esac


(
  sedit  "s:/sbin/depmod:/bin/true:g"  Makefile
  modprobe  soundcore
  ./configure  --prefix=/usr         \
               --with-isapnp=yes     \
               --with-sequencer=yes  \
               --with-oss=yes        \
               --with-debug=none     \
               --with-cards=$CARD    \
               --with-kernel=/usr/src/linux  &&
  make                &&
  prepare_install     &&
  remove_old_modules  &&
  make    install     &&
  ./snddevices

) > $C_FIFO 2>&1  &&  (

  rm  -f   /dev/snd
  ln  -sf  /devices/snd  /dev/snd
  ln  -sf  ../init.d/alsasound  /etc/rcS.d/S99alsasound
  if    [  -f      /etc/modules.d/alsa  ]
  then  mv         /etc/modules.d/alsa  \
                   /etc/modules.d.alsa.old
  else  mkdir  -p  /etc/modules.d
  fi
  mconf   >    /etc/modules.d/alsa
  touch        /etc/modules.d/alsa

)
