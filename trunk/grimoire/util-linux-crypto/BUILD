sedit  "s/HAVE_SLN=no/HAVE_SLN=yes/"   MCONFIG
sedit  "s/# ADD_RAW=yes/ADD_RAW=yes/"  MCONFIG
sedit  "s/\$(OPT)//"                   MCONFIG
(

  bzcat  $(  guess_filename  ${SOURCE[1]}  )  |
  patch  -p1

 ./configure  --build=$BUILD           \
              --prefix=/usr            &&
  make                                 &&
  if    spell_installed      util-linux
  then  dispel  --nosustain  util-linux;  true
  fi                                   &&
  prepare_install                      &&
  make    install

) > $C_FIFO 2>&1  &&

if  !  [  -x  /etc/init.d/bootmisc.sh  ];  then
  cp  $SCRIPT_DIR/bootmisc.sh  /etc/init.d
fi
