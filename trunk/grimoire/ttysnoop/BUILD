(

    patch  -p1  < $SCRIPT_DIR/ttysnoop-0.12c.patch  &&
    make             &&
    prepare_install  &&
    make    install

) > $C_FIFO 2>&1
