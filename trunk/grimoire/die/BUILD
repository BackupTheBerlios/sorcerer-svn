RD="#!/bin/bash\ncd  /opt/die\n./die"
GD="/usr/games/die"
OD="/opt/die"
PF="s:python:python2.2"
DP="bin/die.py"

./build  --prefix=/usr        \
         --bindir=/usr/games  &&
prepare_install               &&
rm     -rf  bld  build src    &&
sed    -i  "$PF"  $DP         &&
mkdir  -p   $OD               &&
mv     *    $OD/              &&
echo   -e  "$RD"  >  $GD      &&
chmod  0755          $GD
