rm     -f  *.dll

sed    -i  "s:g++ :g++ $CXXFLAGS :
            s:gcc :gcc $CFLAGS :
            s:-o fft:-o fft $LDFLAGS:"  Makefile

# grep   -l "scenario/" *.cpp  |
# sort                         |
# uniq                         |
# sed    -i  "s:scenario/:/usr/share/fftrader/scenario/:"

# grep   -l "fonts/" *.cpp  |
# sort                      |
# uniq                      |
# xargs  sed  -i  "s:fonts/:/usr/share/fftrader/fonts/:"

# grep   -l "fpk/" *.cpp  |
# sort                    |
# uniq                    |
# xargs  sed  -i  "s:fpk/:/usr/share/fftrader/fpk/:"

make_install()  {
  set      -x
  chmod    0755  scenario    fonts    fpk
  chmod    0644  scenario/*  fonts/*  fpk/*
  mkdir    -p                              /usr/share/fftrader
  cp       -r    scenario    fonts    fpk  /usr/share/fftrader

  mkdir    -p    /usr/games  /usr/libexec
  (  echo     '#!/bin/sh'
     echo     'cd  /usr/share/fftrader'
     echo     'exec /usr/libexec/fft "$@"'
  )  >                /usr/games/fft
  chmod        0755   /usr/games/fft
  install  -m  0755  fft  /usr/libexec
# touch                   /usr/share/fftrader/prefs
# chmod        0666       /usr/share/fftrader/prefs
}

make             &&
prepare_install  &&
   make_install
