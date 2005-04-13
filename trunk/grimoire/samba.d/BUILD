if    spell_installed  Linux-PAM
then  WITH_PAM="--with-pam  --with-pam_smbpass"
fi


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
fi                                 &&
if  [  -f  /usr/lib/samba/libsmbclient.so  ];  then
  ln   -s           samba/libsmbclient.so  \
                 /usr/lib/libsmbclient.so
fi
