LOC=/etc/networks.d/
WHY=Network
DES="provides a method for configuring a box to connect to networks
$(< /etc/networks.d/templates/README )"

method(){
 clear
 echo "Now starting a shell.  Please \"exit\" when complete."
 cd    /etc/networks.d/templates  &&
 ls
 /bin/bash
}
