default_build  &&  (

set      -x
install  -m 644  wvinternal.h  /usr/include/

cat  <<  EOF  >  /usr/bin/wv-incconfig
#!/bin/sh
echo  -I/usr/include  \$(  glib-config  --cflags  )
EOF

cat  <<  EOF  >  /usr/bin/wv-libconfig
#!/bin/sh
echo -L/usr/lib -lwv -lpng -lz -L/usr/lib -lglib -lm 
EOF

)
