gcc_case()  {
  case  $(  installed_version  $(  get_provider  gcc  )  )  in
    3.3*)  patch  -p1  <  $SCRIPT_DIR/SDL-1.2.6.patch  ;;
  esac
}

#  fixes for DirectFb 0.9.16 or later

case  $VERSION  in
  1.2.5|1.2.4|1.2.3)
    sed  -i  "s:DSPF_RGB15:DSPF_ARGB1555:g"  src/video/directfb/SDL_DirectFB_video.c
    sed  -i  "s:DICAPS_ALL,::"               src/video/directfb/SDL_DirectFB_video.c  
    gcc_case  ;;
  1.2.6)  patch  -p1  <  $SCRIPT_DIR/SDL-1.2.6-alsa1.patch  
          gcc_case  ;;
esac

# to compile with gcc 3.4.0
# it's going to require some source patches
# case  $(  installed_version  gcc  )  in
#   3.4.0)    CFLAGS="$CFLAGS    -fno-unit-at-a-time"
#           CXXFLAGS="$CXXFLAGS  -fno-unit-at-a-time"  ;;
# esac

default_build
