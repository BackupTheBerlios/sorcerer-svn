#!/bin/sh

spell_to_branch()  {  (
  SPELL="$1";  BRANCH="$2"
  if    [  -e    ${SPELL}  ]
  then  mv       ${SPELL}  ${SPELL},${BRANCH}
  fi

)  }

compile_to_branch()  {  (
  SPELL="$1";  BRANCH="$2"
  if    [  -e    ${SPELL}.bz2  ]
  then  mv       ${SPELL}.bz2  ${SPELL},${BRANCH}.bz2
  fi
)  }

install_to_branch()  {  (
  SPELL="$1";  BRANCH="$2";  VLS="/var/log/sorcery"
  if  [  -e    ${SPELL}  ];  then
    sed  "s:^$VLS/compile/${SPELL}.bz2:$VLS/compile/$SPELL,$BRANCH.bz2:
          s:^$VLS/install/${SPELL}:$VLS/install/$SPELL,$BRANCH:
          s:^$VLS/version/${SPELL}:$VLS/version/$SPELL,$BRANCH:
          s:^$VLS/md5sum/${SPELL}:$VLS/md5sum/$SPELL,$BRANCH:"  \
            ${SPELL}  >  ${SPELL},${BRANCH}
    rm  -f  ${SPELL}
  fi

)  }


main()  {
  if  !  [  -d  /var/log/sorcery/install/bash  ];  then
    cd /var/log/sorcery/version
    for  SPELL  in  *;  do
      cd  /var/log/sorcery
      unset  BRANCH
      BRANCH="$(  cat  branch/$SPELL  2>/dev/null  )"
      if  [  -n  "$BRANCH"  ];  then
        cd     install;  install_to_branch  $SPELL  $BRANCH
        cd  ../compile;  compile_to_branch  $SPELL  $BRANCH

        for    DIR  in  version  md5sum  config   hold  exile  \
                        provide  opt.on  opt.off  snap  gcc2
        do    cd  ../$DIR;  spell_to_branch  $SPELL  $BRANCH
        done
      fi
    done
    rm  -rf  /var/log/sorcery/branch      
    rm  -rf  /var/log/sorcery/use
    rm  -rf  /var/log/sorcery/provide
  fi
}


main
