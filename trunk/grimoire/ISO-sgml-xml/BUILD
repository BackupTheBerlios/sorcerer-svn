install_files()  {

  mkdir  -p        /usr/share/sgml/iso-entities-8879.1986  &&
  unzip -o ${SOURCE_CACHE}/$BSPELL/$VERSION/${SOURCE[0]} -d /usr/share/sgml/iso-entities-8879.1986/ &&
  mkdir  -p        /usr/share/xml/iso-entities-8879.1986   &&
  unzip -o ${SOURCE_CACHE}/$BSPELL/$VERSION/${SOURCE[1]} -d /usr/share/xml/iso-entities-8879.1986/ &&

  mkdir  -p                                              /etc/sgml/sgml.d  &&
  cp         $SCRIPT_DIR/iso-entities-8879.1986.cat      /etc/sgml/sgml.d  &&
  mkdir  -p                                              /etc/xml/xml.d    &&
  cp         $SCRIPT_DIR/iso-entities-8879.1986-xml.cat  /etc/xml/xml.d

}

install_catalog()  {

  rm  -f                         /etc/sgml/catalog  &&
  cat     /etc/sgml/sgml.d/*  >  /etc/sgml/catalog  &&
  rm  -f                         /etc/xml/catalog   &&
  cat     /etc/xml/xml.d/*    >  /etc/xml/catalog

}


prepare_install        &&
        install_files  &&
        install_catalog
