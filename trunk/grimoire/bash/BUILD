CX=2
while  [  -n  "${SOURCE[$CX]}"  ]
do  patch  -p2  <  \
    $(  guess_filename  "${SOURCE[$CX]}"  \
                         ${SOURCE_CACHE}/$BSPELL/$VERSION  )
    ((  CX++  ))
done

BUILD="$( arch )-pc-linux-gnu"

./configure  --build=$BUILD  \
             --prefix=/usr   \
             --bindir=/bin   \
             --with-installed-readline  \
             --with-curses   &&
make                         &&
prepare_install              &&
make    install              &&
ln     -sf  bash  /bin/sh
