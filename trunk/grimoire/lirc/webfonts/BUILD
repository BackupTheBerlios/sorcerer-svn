(
  
  FONTS="andale32.exe  arial32.exe  arialb32.exe
         courie32.exe  comic32.exe  georgi32.exe 
	 impact32.exe  times32.exe  trebuc32.exe
         verdan32.exe  webdin32.exe"

  DIR="/usr/X11R6/lib/X11/fonts/TrueType"
  
  prepare_install                        &&
  mkdir -p $DIR                          &&
  for i in ${FONTS}; do
    /usr/bin/cabextract -L $i -d ${DIR} 
  done				         &&  
  rm -rf ${DIR}/{*dll,*inf,*exe,*txt}    &&
  /usr/bin/X11/mkfontscale   ${DIR}      &&        
  cp $DIR/fonts.scale $DIR/fonts.dir     &&
  mkdir   -p   /usr/doc/webfonts         &&
  cp Licen.TXT /usr/doc/webfonts
  
) > $C_FIFO 2>&1  
