build_client()  {
  USDC="/usr/share/dm_client"
   RUN="#!/bin/bash\ncd  $USDC\n./daimonin \"\$@\""
    UG="/usr/games"
   UGD="$UG/daimonin"

  cd      daimonin/client/make/linux
  bash    ./configure  --prefix=/opt/daimonin  &&
  make             &&
  prepare_install  &&
  make    install
}


build_server()  {
  echo  "Probably similar to client"
  echo  "However since it failed to compile, who knows."
  false
}


build_editor()  {
  echo  "Since server failed to compile editor not attempted."
  false
}


case  $BRANCH  in
  client)  build_client  ;;
  server)  build_server  ;;
  editor)  build_editor  ;;
esac
