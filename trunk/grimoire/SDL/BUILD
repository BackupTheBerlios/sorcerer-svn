gcc_fixes()  {
         GCC_VER=$(  installed_version  $(  get_provider  gcc  )  )
  case  $GCC_VER  in
    3.4.*)  patch  -p1  <  $SCRIPT_DIR/SDL-1.2.7-gcc-3.4.patch  ;;
  esac
}

case  $VERSION  in
  1.2.7)  gcc_fixes  ;;
esac


# SDL unnecessarily links using g++.
sed  -i  "s:\$(CXXLINK):\$(LINK):"  src/Makefile.in
default_build
