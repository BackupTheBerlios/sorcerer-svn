(

  WHERE="sysconfdir=/etc localstatedir=/var/cache libexecdir=/usr/bin"

  ./configure   --build=$BUILD  \
                --prefix=/usr   &&
  make             $WHERE       &&
  prepare_install               &&
  make    install  $WHERE

) > $C_FIFO 2>&1
