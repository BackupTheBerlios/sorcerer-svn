(
  CFG_DIR="/usr/share/games/quake"
  CFG="$CFG_DIR/config.cfg"
   UG="/usr/games"

  prepare_install       &&
  mkdir  -p   $CFG_DIR  &&
  touch       $CFG      &&
  chmod  a+w  $CFG      &&
  mkdir  -p   $UG       &&
  install  -m 755  $SCRIPT_DIR/darkplaces  $UG

)  > $C_FIFO 2>&1
