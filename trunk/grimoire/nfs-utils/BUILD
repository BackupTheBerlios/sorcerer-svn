unalias  make

./configure  --prefix=/usr  &&
make                        &&
make  install               &&

cp  $SCRIPT_DIR/nfslock.sh  /etc/init.d  &&
cp  $SCRIPT_DIR/nfs.sh      /etc/init.d  &&

if    $NFS_BOOT;  then
  ln  -sf  ../init.d/nfs.sh  /etc/rc0.d/K60nfs
  ln  -sf  ../init.d/nfs.sh  /etc/rc1.d/K60nfs
  ln  -sf  ../init.d/nfs.sh  /etc/rc2.d/K60nfs
  ln  -sf  ../init.d/nfs.sh  /etc/rc6.d/K60nfs

  ln  -sf  ../init.d/nfs.sh  /etc/rc3.d/S40nfs
  ln  -sf  ../init.d/nfs.sh  /etc/rc4.d/S40nfs
  ln  -sf  ../init.d/nfs.sh  /etc/rc5.d/S40nfs
elif  $NFSLOCK_BOOT;  then
  ln  -sf  ../init.d/nfslock.sh  /etc/rc0.d/K60nfslock
  ln  -sf  ../init.d/nfslock.sh  /etc/rc1.d/K60nfslock
  ln  -sf  ../init.d/nfslock.sh  /etc/rc2.d/K60nfslock
  ln  -sf  ../init.d/nfslock.sh  /etc/rc6.d/K60nfslock

  ln  -sf  ../init.d/nfslock.sh  /etc/rc3.d/S40nfslock
  ln  -sf  ../init.d/nfslock.sh  /etc/rc4.d/S40nfslock
  ln  -sf  ../init.d/nfslock.sh  /etc/rc5.d/S40nfslock
fi
