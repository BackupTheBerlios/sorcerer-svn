(

  GD="GAMEDIR=/usr/share/sasteroids"
  BD="BINDIR=/usr/games"
  MD="MANDIR=/usr/man"

  make             "$GD" "$BD" "$MD"  &&
  prepare_install                     &&
  make    install  "$GD" "$BD" "$MD"

) > $C_FIFO 2>&1
