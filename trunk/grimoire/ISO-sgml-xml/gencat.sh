#!/bin/sh
rm -f /etc/sgml/catalog
for I in $(ls /etc/sgml/sgml.d/); 
do 
	cat /etc/sgml/sgml.d/$I >>/etc/sgml/catalog
done
rm -f /etc/xml/catalog
for I in $(ls /etc/xml/xml.d/); 
do 
	cat /etc/xml/xml.d/$I >>/etc/xml/catalog
done