    CC="--with-cc=gcc $CFLAGS"
LDOPTS="--with-ldopts=$LDFLAGS"

# --disable-readline added for dump version 0.4b33
# because it complained that it required termcap.

./configure  --prefix=/usr       \
             --enable-largefile  \
             --enable-rmt        \
             --disable-readline  \
             "$CC"               \
             "$LDOPTS"           &&
make             &&
prepare_install  &&
make    install
