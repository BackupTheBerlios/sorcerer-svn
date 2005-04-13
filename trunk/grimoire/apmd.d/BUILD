case  $VERSION  in
  3.0.2)  patch  -p0  <  $SCRIPT_DIR/apmd-3.0.2.patch
esac

if    echo  "$OPTS"  |  grep  -q  "\--without-x11"
then  patch  -p1  <  $SCRIPT_DIR/apmd.Makefile.nox11.diff
fi

sed  -i  "s:CFLAGS=-O -g:CFLAGS=$CFLAGS:"   Makefile
  
make           &&
make  install  &&
cp  $SCRIPT_DIR/apmd.sh  /etc/init.d
