# DirectFB can have some sort of weird circular requirement with SDL.
# That is why --disable-sdl is put into the configure.

matrox_maven_patch()  {

  local  LVER
  LVER=$(  installed_version  $(  get_provider  linux-kernel  )  )
  case  $LVER  in
    2.6*)  bzip2  -cd  $SCRIPT_DIR/DirectFB-0.9.20-matrox_maven.patch.bz2  |
           patch  -p1  ;;
  esac

}


case  $VERSION  in
  0.9.20)  matrox_maven_patch  ;;
esac


export  ac_cv_header_linux_wm97xx_h=no

./configure  --build=$BUILD        \
             --prefix=/usr         \
             --sysconfdir=/etc     \
             --localstatedir=/var  \
             --disable-avifile     \
             --disable-sdl         \
             $OPTS                 &&
make                               &&
prepare_install                    &&
make    install
