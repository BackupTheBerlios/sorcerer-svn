if    spell_installed  Linux-PAM  ||
      spell_installed  $(  get_provider  Linux-PAM  )
then  WITH_PAM="--with-pam"
fi


selinux_patches()  {
  SCX=1
  while  [  -n                    "${SOURCE[$SCX]}"    ]
  do     zcat  $(  guess_filename  ${SOURCE[$SCX]}  )  |
         patch  -p1
         ((  SCX++  ))
  done
}


case  $BRANCH  in
  selinux)  selinux_patches  ;;
esac


groupadd    sshd        2>/dev/null
useradd  -g sshd  sshd  2>/dev/null
mkdir    -p       /var/empty
chmod       755   /var/empty

./configure  --prefix=/usr          \
             --sysconfdir=/etc/ssh  \
             --with-md5-passwords   \
             $WITH_PAM              \
             $OPTS                  &&
make                                &&
prepare_install                     &&
make    install
