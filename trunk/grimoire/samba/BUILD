if    spell_installed  Linux-PAM
then  WITH_PAM="--with-pam  --with-pam_smbpass"
fi


missing_include()  {
  local      SED="\:#include <linux/smb_fs.h>:i#include <linux/netlink.h>"
  sed  -i  "$SED"  source/client/smbmount.c  \
                   source/client/smbumount.c
}


what_linux_ver()  {

  case  $(  installed_version  $(  get_provider linux-kernel  )  )  in
    2.6*)  missing_include  ;;
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
