sed  -i  's:"playmidi","-v","-v","-e":"playmus","playmus","-r","44100":'  \
     audio/midi_drivers/forked_player.cc

./configure  --prefix=/usr         \
             --sysconfdir=/etc     \
             --localstatedir=/var  \
             --bindir=/usr/games   \
             --disable-timidity    \
             $OPTS                 &&
make             &&
make    install  &&
cp      $SCRIPT_DIR/exult.cfg  /usr/share/exult  &&
cp      sfx/jmsfx.flx          /usr/share/exult  &&
cp      sfx/jmsisfx.flx        /usr/share/exult  &&
cp  -a  music                  /usr/share/exult
