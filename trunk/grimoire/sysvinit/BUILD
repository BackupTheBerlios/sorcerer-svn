selinux_patches()  {
  SCX=1
  while  [  -n                    "${SOURCE[$SCX]}"    ]
  do     zcat  $(  guess_filename  ${SOURCE[$SCX]}  )  |
         patch  -p1
         ((  SCX++  ))
  done
  patch  -p1  <  $SCRIPT_DIR/sysvinit-selinux.patch
}


case  $BRANCH  in
  selinux)  selinux_patches  ;;
esac


make  -C src  &&
make  -C src  install
