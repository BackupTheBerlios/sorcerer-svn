case  $VERSION  in
  1.1)  patch  -p1  <  $SCRIPT_DIR/faad2-1.1.patch  ;;
esac

# ./bootstrap
autoreconf -vif
sed  -i  "600,605d"  Makefile.in
default_build
