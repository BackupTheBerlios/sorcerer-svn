(

  ./configure  --prefix=/usr       \
               --enable-largefile  \
               --enable-rmt        &&
  make                             &&
  prepare_install                  &&
  make    install                  &&
  message  "$(  cat  $SCRIPT_DIR/message.txt  )"  

) > $C_FIFO 2>&1
