(

db_41_fix()  {  (
  DBV="$(  installed_version  $(  get_provider  db  )  )"
  case  ${DBV:0:3}  in
    4.1)  sed  -i  "s:ret, name:ret, NULL, name:"  libraries/libldbm/ldbm.c  ;;
  esac
)  }

  db_41_fix

  # export   lt_cv_prog_cc_static_works=no
  # sed  -i  's:LTSTATIC="-static":LTSTATIC="":'  configure
  #            --with-bdb-module=dynamic  \
  #            --enable-static=no         \

  ./configure  --build=$BUILD             \
               --prefix=/usr              \
               --sysconfdir=/etc          \
               --localstatedir=/var       \
               --enable-shell             \
               --disable-debug            \
               $OPTS                      &&
  make                                    &&
  prepare_install                         &&
  make    install

) > $C_FIFO 2>&1
