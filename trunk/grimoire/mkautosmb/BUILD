(

  prepare_install  &&

  if    !  [  -f  /etc/shares.excl  ]
  then  cp             shares.excl  \
                  /etc/shares.excl
  fi  &&
  cp              cron_mkautosmb    \
                       mkautosmb    \
                  /usr/bin

) > $C_FIFO 2>&1
