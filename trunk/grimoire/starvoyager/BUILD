(

  BD="BINDIR=/usr/games"
  CF="CFLAGS=$CFLAGS  $(  sdl-config  --cflags )"
  LF="LIBS=$LDFLAGS   $(  sdl-config  --libs   ) -lSDL_net -lstdc++"
  PF="PREFIX=/usr"

  make "$CF" "$LF" "$PF" "$BD"  &&
  prepare_install               &&
  make    install  "$PF" "$BD"

) > $C_FIFO 2>&1
