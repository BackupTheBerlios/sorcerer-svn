(

  if    [  "$PREFIX"  ==  "/usr"  ]
  then  CLD="/opt/ClanLib/0.5.3-1"
  else  CLD="$PREFIX/opt/ClanLib/0.5.3-1"
  fi

  export    CFLAGS="$CFLAGS    -I$CLD/include"
  export  CXXFLAGS="$CXXFLAGS  -I$CLD/include"
  export   LDFLAGS="$LDFLAGS   -L$CLD/lib  -Wl,-rpath,$CLD/lib"

  sedit  "s:-o \.\./race :$LDFLAGS -o ../race :"  src/Makefile.in
  sedit  "s:-g -O3 -Wall::"  src/Makefile.in
  sedit  "s:-O3 -Wall::"         Makefile.in

  CX=1
  while  [  -n  "${SOURCE[$CX]}"  ]
  do     cp  $(  guess_filename  ${SOURCE[$CX]}  )  resources/music
         ((  CX++ ))
  done

  PGR="$PREFIX/games/Race"

  ./configure  --prefix=$PREFIX        \
               --bindir=$PREFIX/games  &&
  make                                 &&
  prepare_install                      &&
  mkdir  -p  $PREFIX/share/Race        &&
  cp     -a  build      \
             cars       \
             data       \
             race       \
             resources  \
             themes     \
             tracks     \
             $PREFIX/share/Race              &&
  echo   "#!/bin/sh"                >  $PGR  &&
  echo   "cd  $PREFIX/share/Race"  >>  $PGR  &&
  echo   "./race"                  >>  $PGR  &&
  chmod  a+x                           $PGR

) > $C_FIFO 2>&1
