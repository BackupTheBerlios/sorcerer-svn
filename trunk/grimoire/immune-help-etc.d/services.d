LOC=/etc/services.d/local
WHY=Network
DES="port numbers and names associations for TCP UDP services

/etc/services
maps service names to TCP and UDP port numbers.

When installed a technic called \"services\"
or called \"services-iana-direct\"
can provide a monthly updated,
large, comprehensive list of mappings
provided by IANA,
the organization responsible for
port number to name server assignments.
The file installed by the technic is called
/etc/services.d/IANA

However, any other file in /etc/services.d/
is also merged into /etc/services
/etc/services is generated without the comments
contained in the original files.
Doing so conserves memory."

MAN=services
