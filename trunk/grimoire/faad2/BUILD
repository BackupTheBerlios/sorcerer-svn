case  $VERSION  in
  1.1)  patch  -p1  <  $SCRIPT_DIR/faad2-1.1.patch  ;;
  2.0)  patch  -p1  <  $SCRIPT_DIR/faad2-2.0.patch
        sed    -i      "2,9d"  Makefile.am  ;;
esac

# ./bootstrap
autoreconf -vif
# sed  -i  "600,605d"  Makefile
default_build
