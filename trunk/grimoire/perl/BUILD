db_41_fix()  {  (
  if  [  "$VERSION"  ==  "5.8.0"  ];  then
    DBV="$(  installed_version  $(  get_provider  db  )  )"
    case  ${DBV:0:3}  in
      4.1)  rm  -rf            ext/DB_File
            mv  DB_File-1.806  ext/DB_File
            ;;
    esac
  fi
)  }

unset  LANG  LC_CTYPE

db_41_fix
./Configure  -Dprefix=/usr -d -e -Dusethreads
make  "OPTIMIZE=$CFLAGS"  &&
prepare_install           &&
make    install
