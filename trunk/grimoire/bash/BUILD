install_loadables()  {
  mkdir  -p  /usr/libexec/bash
  cd   examples/loadables
  for  FILE  in  *.c
  do   make     ${FILE%.c}
       install  -s  -m 0755  -o root  -g root  ${FILE%.c}  /usr/libexec/bash
  done
  true
}


CX=1
while  [  -n  "${SOURCE[$CX]}"  ]
do  patch  -p0  <  \
    $(  guess_filename  "${SOURCE[$CX]}"  \
                         ${SOURCE_CACHE}/$BSPELL/$VERSION  )
    ((  CX++  ))
done

# [  -z  "$BUILD"  ]  &&
#          BUILD="$( arch )-pc-linux-gnu"

[  -d  /isolinux  ]  ||
BUILD="$( arch )-pc-linux-gnu"

./configure  --build=$BUILD  \
             --prefix=/usr   \
             --bindir=/bin   \
             --with-installed-readline  \
             --with-curses   \
             $OPTS           &&
make                         &&
prepare_install              &&
make    install              &&
ln     -sf  bash  /bin/sh    &&
install_loadables
