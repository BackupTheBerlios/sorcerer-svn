#  fixes for DirectFb 0.9.16 or later

case  $VERSION  in
  1.2.5|1.2.4|1.2.3)
    sed  -i  "s:DSPF_RGB15:DSPF_ARGB1555:g"  src/video/directfb/SDL_DirectFB_video.c
    sed  -i  "s:DICAPS_ALL,::"               src/video/directfb/SDL_DirectFB_video.c  ;;
  1.2.6)  patch  -p1  <  $SCRIPT_DIR/SDL-1.2.6-alsa1.patch  ;;
esac

gcc_case()  {
  case  $(  installed_version  $(  get_provider  gcc  )  )  in
    3.3*)  patch  -p1  <  $SCRIPT_DIR/SDL-1.2.6.patch  ;;
  esac
}

gcc_case

default_build
