mkdir -p /etc/xml/xml.d/
mkdir -p /etc/sgml/sgml.d/


mkdir -p /usr/share/sgml/iso-entities-8879.1986/
unzip -o ${SOURCE_CACHE}/$BSPELL/$VERSION/${SOURCE[0]} -d /usr/share/sgml/iso-entities-8879.1986/
cp -R $SCRIPT_DIR/iso-entities-8879.1986.cat /etc/sgml/sgml.d/

mkdir -p /usr/share/xml/iso-entities-8879.1986/
unzip -o ${SOURCE_CACHE}/$BSPELL/$VERSION/${SOURCE[1]} -d /usr/share/xml/iso-entities-8879.1986/
cp -R $SCRIPT_DIR/iso-entities-8879.1986-xml.cat /etc/xml/xml.d/

cat /etc/sgml/sgml.d/* >/etc/sgml/catalog 
cat /etc/xml/xml.d/* >/etc/xml/catalog