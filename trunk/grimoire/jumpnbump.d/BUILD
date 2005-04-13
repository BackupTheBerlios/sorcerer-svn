install_levels()  {
              USJ=/usr/share/jumpnbump
  mkdir  -p  $USJ
  CX=1
  while  [   -n           "${SOURCE[$CX]}"  ];  do
    decompress                                          \
      $(  guess_filename  "${SOURCE[$CX]}"              \
                          "${SOURCE_CACHE}/$BSPELL"  )  \
                  >  "$USJ/${SOURCE[$CX]/.bz2/}"
    touch            "$USJ/${SOURCE[$CX]/.bz2/}"
    ((  CX++  ))
  done
}


make             &&
prepare_install  &&
make    install  PREFIX=/usr  &&
install_levels
