sed  -i  "s:-version-info:-lc -ldl -lstdc++ $LDFLAGS -version-info:"  Makefile.in
sed  -i  "1i#define NOT_IN_libc 1"  lib/plasticfs/opendir.cc
# sed  -i  "s:geteuid() == 0 ||::"    lib/plasticfs/parse.cc

./configure  --build=$BUILD        \
             --prefix=/usr         \
             --sysconfdir=/etc     \
             --localstatedir=/var  \
             $OPTS                 &&
make                               &&
prepare_install                    &&
make    install  HAVE_GROFF=no     &&
cp     -r  man  /usr/
