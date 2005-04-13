install_init()  {
  cp    $SCRIPT_DIR/msyslog.sh  /etc/init.d
  ln  -sf ../init.d/msyslog.sh  /etc/rcS.d/S20msyslog
  ln  -sf ../init.d/msyslog.sh  /etc/rc0.d/K70msyslog
  ln  -sf ../init.d/msyslog.sh  /etc/rc6.d/K70msyslog
}


install_etc()  {

  cp   $SCRIPT_DIR/syslog.conf    /etc

  mkdir  -p  /etc/syslog.conf.examples

  for  FILE  in  src/examples/syslog.conf.*
  do   install  -m 0444  -o root  -g root  \
                $FILE  /etc/syslog.conf.examples
  done

}


case  $(  uname  -r  )  in
  2.6*)  sed  -i  "s:ksyms:kallsyms:"  src/modules/im_linux.c  ;;
esac


default_build  &&
install_init   &&
install_etc
