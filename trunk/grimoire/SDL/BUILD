#  fixes for DirectFb 0.9.16 or later

case  $VERSION  in
  1.2.5|1.2.4|1.2.3)
    sed  -i  "s:DSPF_RGB15:DSPF_ARGB1555:g"  src/video/directfb/SDL_DirectFB_video.c
    sed  -i  "s:DICAPS_ALL,::"               src/video/directfb/SDL_DirectFB_video.c
;;

esac

default_build
