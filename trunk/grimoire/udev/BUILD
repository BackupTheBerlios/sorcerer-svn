sed  -i  "s:/local::"  Makefile
make  &&
make  install  &&
cp  -f   $SCRIPT_DIR/sysfsmount.sh  /etc/init.d/        &&
cp          extras/start_udev       /etc/init.d/        &&
cp	 -f	etc/udev/udev.permissions.gentoo  /etc/udev/ &&
ln  -fs  ../init.d/start_udev       /etc/rcS.d/S05udev  &&
ln  -fs  ../init.d/sysfsmount.sh    /etc/rcS.d/S00sysfsmount  &&
(
	if echo $OPTS | grep -q "dev-udev"; then
		sed -i "s,udev_root=.*,udev_root=\"/dev/\"," /etc/udev/udev.conf
		sed -i "s,udev_db=.*,udev_db=\"/dev/.udev.tdb\"," /etc/udev/udev.conf
	fi
	#sed -i "s,udev_rules=.*,udev_rules=\"/etc/udev/udev.rules\"," /etc/udev/udev.conf
	sed -i "s,udev_permissions=.*,udev_permissions=\"/etc/udev/udev.permissions.gentoo\"," /etc/udev/udev.conf
)
