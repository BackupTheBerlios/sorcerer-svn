DEST_DIR="/opt/j2sdk/$VERSION"
MOZ_PLUG="$DEST_DIR/jre/plugin/i386/mozilla/javaplugin_oji.so"
MOZ_PDIR="/usr/lib/mozilla/plugins"

prepare_install                          &&
mkdir  -p                 $DEST_DIR      &&
cp     -R   $BUILD_DIR/*  $DEST_DIR      &&
cd                        $DEST_DIR/bin  &&
for  FILE  in  *;  do
  if    [  -f     $FILE  ]  &&
        [  -x     $FILE  ]
  then  ln  -sfv  $DEST_DIR/bin/${FILE}  \
                       /usr/bin/${FILE}
  fi
done  &&

if    [   -d               $MOZ_PDIR  ]
then  ln  -vsf  $MOZ_PLUG  $MOZ_PDIR/javaplugin_oji.so
fi
