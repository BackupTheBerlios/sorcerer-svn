G="/opt/guile/1.4.1"
export  PATH="$G/bin:$PATH"
export  LDFLAGS="-L$G/lib $LDFLAGS -Wl,-rpath=$G/lib"
./configure  --build=$BUILD       \
             --prefix=/usr        \
             --bindir=/usr/games  \
             $OPTS                &&
make                              &&
make  install
