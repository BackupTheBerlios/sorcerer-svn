(

  prepare_install  &&

  if    !  [  -f  /etc/shares.excl  ]
  then  cp    -v       shares.excl  \
                  /etc/shares.excl
  fi  &&
  cp          -v  cron_mkautosmb    \
                  mkautosmb         \
                  /usr/bin

) > $C_FIFO 2>&1
