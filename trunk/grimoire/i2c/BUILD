(

  make  LINUX_INCLUDE_DIR=/usr/include/i2c/linux  all  &&
  prepare_install                                      &&
  make  LINUX_INCLUDE_DIR=/usr/include/i2c/linux       \
        PREFIX=/usr                                    \
	MANDIR=/usr/man                                \
	install      
   
) > $C_FIFO 2>&1
