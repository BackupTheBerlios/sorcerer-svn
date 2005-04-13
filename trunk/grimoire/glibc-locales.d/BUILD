prepare_install
rm     -rf  /usr/lib/locale
mkdir  -p   /usr/lib/locale
echo  "$LOCALES"  |
while  read  LC;  do
     NAME="$(  echo  $LC  |  cut  -d /  -f1  )"
  CHARMAP="$(  echo  $LC  |  cut  -d /  -f2  )"
  echo       -n  "$NAME.$CHARMAP..."
  localedef  -i   $NAME  -c  -f $CHARMAP  $NAME
  echo           " done"
done
touch  /usr/lib/locale/locale-archive
