if    spell_installed  Linux-PAM
then  WITH_PAM="--with-pam  --with-pam_smbpass"
fi


what_linux_ver()  {
  case  $(  installed_version  $(  get_provider linux-kernel  )  )  in
    2.6*)  patch  -p1  <  $SCRIPT_DIR/samba-3.0.4.linux-2.6.patch  ;;
  esac
}


case  $VERSION  in
  3.0.4)  what_linux_ver  ;;
esac


cd  source
./configure  --prefix=/usr         \
             --sysconfdir=/etc     \
             --localstatedir=/var  \
             --with-smbmount       \
             --with-fhs            \
             $WITH_PAM             \
             $OPTS                 &&
make                               &&
prepare_install                    &&
mkdir  -p  /etc/samba              &&
mkdir  -p  /usr/share/samba        &&
mkdir  -p  /var/log/samba          &&
make    install                    &&
if  [  -d  /usr/private  ];  then
  rmdir    /usr/private
  true
fi
