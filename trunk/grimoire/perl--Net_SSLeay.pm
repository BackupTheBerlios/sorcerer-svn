   VERSION=( "1.30" "1.25" )
     PNAME=${SPELL#perl--}
  CATEGORY="perl security/encryption"
 ATTRIBUTE="perl-module new"
    SOURCE="F/FL/FLORA/$PNAME-$VERSION.tar.gz"
       URL="http://www.cpan.org/authors/id/"
  HOMEPAGE="http://search.cpan.org/search?dist=$PNAME"
       REQ="perl openssl"
  ESTIMATE="10"
  EPROVIDE="Net_SSLeay"
      DESC="$SPELL allows scripts to call the functions in the OpenSSL library
Net::SSLeay.pm - a perl module for calling 
Secure Sockets Layer (SSL) functions of the 
SSLeay library directly from your perl scripts.
It is useful if you want to program robots that 
access secure web servers or if you want to 
build your own applications over SSL encrypted tunnels.
"
