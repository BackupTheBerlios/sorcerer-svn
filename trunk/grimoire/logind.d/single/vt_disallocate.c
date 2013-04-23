#include <sys/types.h>
#include <sys/stat.h>
#include <fcntl.h>
#include <sys/ioctl.h>
#include <linux/vt.h>

int main ( int argc, char *argv[] ){
ioctl ( open ( "/dev/console", O_RDWR ), VT_DISALLOCATE, 0 );
}
