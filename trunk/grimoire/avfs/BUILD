install_profile()  {

  if    !  [  -f  /etc/profile.d/avfscoda.sh  ]
  then  cp               scripts/avfscoda.sh  /etc/profile.d
  fi

}


for  DEST  in  scripts/init/avfscoda.*
do   cp         $SCRIPT_DIR/avfscoda.sh  $DEST
done

./configure  --build=$BUILD        \
             --prefix=/usr         \
             --sysconfdir=/etc     \
             --localstatedir=/var  \
             --disable-preload     \
             --enable-libxml       \
             --with-kernel=/usr/src/linux  \
             $OPTS                 &&
make                               &&
prepare_install                    &&
make    install                    &&
install_profile
