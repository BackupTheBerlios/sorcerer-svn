if    !  spell_installed  linuxdoc-tools
then  sed  -i  "s:lct.html::
                s:kbd.FAQ.html::"  doc/Makefile.in
fi

case  $VERSION  in
  0.2.3)  patch  -p1  <  $SCRIPT_DIR/console-tools-0.2.3.patch  ;;
esac

./configure  --build=$BUILD        \
             --prefix=/usr         \
             --sysconfdir=/etc     \
             --localstatedir=/var  \
             $OPTS                 &&
make                               &&
prepare_install                    &&
make    install
