finish_install()  {

  mkdir  -p  /usr/share/httpd/cgi-bin.ssl
  mkdir  -p  /usr/share/httpd/htdocs.ssl
  mkdir  -p  /usr/share/httpd/logs
  mkdir  -p    /var/lib/httpd/run
  cp        $SCRIPT_DIR/httpd.sh  /etc/init.d

  if  $APACHE_BOOT;  then
    ln  -sf   ../init.d/httpd.sh  /etc/rc0.d/K10httpd
    ln  -sf   ../init.d/httpd.sh  /etc/rc1.d/K10httpd
    ln  -sf   ../init.d/httpd.sh  /etc/rc2.d/K10httpd
    ln  -sf   ../init.d/httpd.sh  /etc/rc6.d/K10httpd

    ln  -sf   ../init.d/httpd.sh  /etc/rc3.d/S90httpd
    ln  -sf   ../init.d/httpd.sh  /etc/rc4.d/S90httpd
    ln  -sf   ../init.d/httpd.sh  /etc/rc5.d/S90httpd
  fi

}

  fix_ssl_conf()  {

    cd  docs/conf

        SR="@@ServerRoot@@"
      CONF="/etc/httpd"
       CGI="/usr/share/httpd/cgi-bin.ssl"
    HTDOCS="/usr/share/httpd/htdocs.ssl"
    cp  ssl-std.conf  ssl-std.conf.b4
    sed  "s:$SR/conf:/etc/httpd:
          s:$SR/cgi-bin:/$CGI:
          s:$SR/htdocs:$HTDOCS:
          s:logs/:/var/log/httpd:"  \
          ssl-std.conf.b4  >  ssl-std.conf
    cd  ../..

  }

  db_41_fix()  { (
    DBV="$(  installed_version  $(  get_provider  db  )  )"
    case  ${DBV:0:3}  in
      4.1)  sed  -i  "s:file.bdb, pathname:file.bdb, NULL, pathname:"  srclib/apr-util/dbm/apr_dbm_berkeleydb.c  ;;
    esac
  ) }


db_41_fix

cat  $SCRIPT_DIR/layout      >>                  config.layout
cat  $SCRIPT_DIR/layout.apr  >>       srclib/apr/config.layout
cat  $SCRIPT_DIR/layout.apr  >>  srclib/apr-util/config.layout

fix_ssl_conf

AC="--enable-layout=Sorcerer  \
    --enable-so               \
    --enable-modules=all      \
    --enable-cache            \
    --enable-cgi              \
    --enable-deflate          \
    --enable-mime-magic       \
    --enable-proxy            \
    --enable-mods-shared=all  \
    --build=$BUILD            \
    --with-mpm=worker         \
    $OPTS"

./configure  $AC  &&
make              &&
prepare_install   &&
make    install   &&
 finish_install
