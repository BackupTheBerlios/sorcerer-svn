#!/bin/sh

make_nodes()  {
  for  ((CX=0;CX<8;CX++))
  do   mknod              /dev/nvidia$CX  c  195  $CX
       chmod  0660        /dev/nvidia$CX
       chown  root:video  /dev/nvidia$CX
  done
       mknod              /dev/nvidiactl  c  195  255
       chmod  0660        /dev/nvidiactl
       chown  root:video  /dev/nvidiactl

  modprobe  nvidia

}

[  -c  /dev/nvidiactl  ]  ||  make_nodes
