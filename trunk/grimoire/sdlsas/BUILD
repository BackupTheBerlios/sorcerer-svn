(

  GD="GAMEDIR=$PREFIX/share/sasteroids"
  BD="BINDIR=$PREFIX/games"
  MD="MANDIR=$PREFIX/man"

  make             "$GD" "$BD" "$MD"  &&
  prepare_install                     &&
  make    install  "$GD" "$BD" "$MD"

) > $C_FIFO 2>&1
