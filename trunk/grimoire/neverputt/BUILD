USN="/usr/share/neverputt"

sed  -i  "s:./data:$USN:"         config.h
sed  -i  "s: -o : $LDFLAGS -o :"  Makefile

CF="CFLAGS=$CFLAGS  -ansi  $(  sdl-config --cflags  )"
DD=$(  find  data  -type d  )

X11="X11_PATH=-L/usr/X11R6/lib"

make        "$CF"  "$X11"  &&
prepare_install            &&
chmod    -R  a+r     data  &&
chmod        0755    $DD   &&
mkdir    -p          $USN  &&
cp       -a  data/*  $USN  &&
install  -m  0755  neverputt  /usr/games
