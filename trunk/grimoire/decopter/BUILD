(

  modify()  {
    while  read                FILE
    do     sedit  "s:$1:$2:"  $FILE
    done
  }

  echo    "utils.cc"                            |
  modify  "/usr/local/games/decopter/textures"  \
          "/usr/share/games/decopter/textures"

  echo    "fly.cc
           gamemanager.cc
           generate_textures.cc
           maps/default.land
           landscape_texture_browser.cc"  |
  modify  "maps/"  "/usr/share/games/decopter/maps/"

#  echo    "maps/default.land"  |
#  modify  "maps/landscape.png"  "landscape.png"


  echo    "gamemanager.cc"  |
  modify  "desc/"  "/usr/share/games/decopter/desc/"

  echo    "fly.cc"  |
  modify  "3D/"  "/usr/share/games/decopter/3D/"

  export  CXXFLAGS="$( sdl-config --cflags )  -I/usr/X11R6/include  $CXXFLAGS"
  export   LDFLAGS="$( sdl-config --libs   )  -L/usr/X11R6/lib  -lSDL_image -lGL -lGLU -lstdc++  $LDFLAGS"

  make  "CXXFLAGS=$CXXFLAGS"  "LDFLAGS=$LDFLAGS"  &&
  prepare_install                                 &&
  chmod  a+r  -R  3D desc fly maps                &&
  cp  -r  maps   /usr/share/games/decopter/maps   &&
  cp  -r  desc   /usr/share/games/decopter/desc   &&
  cp  -r  3D     /usr/share/games/decopter/3D     &&
  cp      fly    /usr/games/decopter              &&
  cp      generate_textures  /usr/games/decopter-generate_textures

) > $C_FIFO 2>&1
