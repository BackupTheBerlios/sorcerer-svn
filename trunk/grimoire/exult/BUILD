(

  cp   audio/midi_drivers/forked_player.cc  \
       audio/midi_drivers/forked_player.cc.original

  sed  's:"playmidi","-v","-v","-e":"playmus","playmus","-r","44100":'  \
       audio/midi_drivers/forked_player.cc.original  >     \
       audio/midi_drivers/forked_player.cc

  ./configure  --prefix=/usr         \
               --sysconfdir=/etc     \
               --localstatedir=/var  \
               --bindir=/usr/games   \
               --disable-timidity    \
               $OPTS                 &&
  make                               &&
  prepare_install                    &&
  make    install

) > $C_FIFO 2>&1  &&  (

  cp  $SCRIPT_DIR/exult.cfg  /usr/share/exult
  cp  sfx/jmsfx.flx          /usr/share/exult
  cp  sfx/jmsisfx.flx        /usr/share/exult

)
