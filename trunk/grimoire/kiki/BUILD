cd  kodilib/linux     &&
make                  &&
cd  ../../kiki/linux  &&
make  "GLLIBS=-L/usr/X11R6/lib -lglut -lGLU -lGL $LDFLAGS"  &&
prepare_install       &&
mkdir  -p                     /usr/games      &&
cp     kiki                   /usr/games      &&
cp     $SCRIPT_DIR/play-kiki  /usr/games      &&
cd     ..                                     &&
mkdir  -p              /usr/share/games/kiki  &&
cp     -a  py  sounds  /usr/share/games/kiki
