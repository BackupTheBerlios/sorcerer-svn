// Copyright 2000 through 2008 by Kyle Sallee,
// All rights reserved.
// For use with the Sorcerer distribution only.

#define _GNU_SOURCE 1

#include <pthread.h>

// includes for chmod

#include <sys/types.h>
#include <sys/stat.h>

// includes for chown and lchown

#include <sys/types.h>
#include <unistd.h>

// includes for creat

#include <sys/types.h>
#include <sys/stat.h>
#include <fcntl.h>

// includes for fopen, freopen

#include <stdio.h>

// includes for link

#include <unistd.h>

// includes for mkdir

#include <sys/stat.h>
#include <sys/types.h>

// includes for open

#include <sys/types.h>
#include <sys/stat.h>
#include <fcntl.h>

// includes for rename

#include <stdio.h>

// includes for symlink

#include <unistd.h>

// includes for truncate

#include <unistd.h>
#include <sys/types.h>

// includes for strlen

#include <string.h>

// includes for get_current_dir_name

#include <unistd.h>

// includes for malloc and atoi

#include <stdlib.h>

// includes for dlopen and dlsym

#include <dlfcn.h>

// includes for variable argument lists

#include <stdarg.h>

// includes for geteuid

#include <unistd.h>
#include <sys/types.h>

// includes for stat

#include <sys/types.h>
#include <sys/stat.h>
#include <unistd.h>

char *ks_previous_path    = NULL;
char *ks_sentinel_logname = NULL;
char *ks_sentinel_overlay = NULL;

void _init(void) {
 ks_previous_path    = NULL;
 ks_sentinel_logname = getenv("SENTINEL_LOG");
 ks_sentinel_overlay = getenv("SENTINEL_OVERLAY");
}


void _fini(void) {
 free(ks_previous_path);
}


char *ks_sentinel_canon(const char *path) {

 char *dest;
 char *cwd;
 int   size;

 if (path[0] == '/') {
  dest = strdup(path);
 } else {
  cwd  = get_current_dir_name();
  size = strlen( path ) + strlen(cwd) + 2;
  dest = (char *)malloc(size);
  strcpy(dest, cwd );
  if ( strcmp( cwd, "/" ) != 0 )
       strcat(dest, "/" );
  strcat(dest, path);
  free(cwd);
 }

 if ( ( strncmp( dest, "/usr/src/", 9 ) == 0 ) ||
      ( strncmp( dest, "/proc/",    6 ) == 0 ) ||
      ( strncmp( dest, "/tmp/",     5 ) == 0 ) ||
      ( strncmp( dest, "/dev/",     5 ) == 0 ) ) {
  free(dest);
  dest = NULL;
 }

 if ( dest != NULL ) {

  if ( ks_previous_path == NULL ) {
       ks_previous_path =  dest;
  } else
  if ( strcmp ( ks_previous_path, dest ) == 0 ) {
   free(dest);
   dest = NULL;
  } else {
   free(ks_previous_path);
   ks_previous_path=dest;
  }
 }

 return(dest);
}


void ks_sentinel_log(const char *path) {

 char *logline;
 int   logfile;
 int  (*glibc_open) (const char *, int, ...);

 if ( (path                != NULL) &&
      (ks_sentinel_logname != NULL) ) {
       logline  = ks_sentinel_canon( path );
  if  (logline != NULL )  {
   glibc_open   = dlsym(RTLD_NEXT, "open");
   logfile      = glibc_open( ks_sentinel_logname, O_WRONLY | O_APPEND);
   if (logfile >= 0) {
    write(logfile, logline, strlen( logline ));
    write(logfile, "\n", 1);
    close(logfile);
   }
  }
 }
}


int chmod(const char *path, mode_t mode) {
 int	(*glibc_chmod)		(const char *, mode_t);

 ks_sentinel_log ( path );
 glibc_chmod = dlsym(RTLD_NEXT, "chmod");
 return ( glibc_chmod(path, mode) );
}


int chown(const char *path, uid_t owner, gid_t group) {
 int	(*glibc_chown)		(const char *, uid_t, gid_t);

 ks_sentinel_log ( path );
 glibc_chown = dlsym(RTLD_NEXT, "chown");
 return ( glibc_chown(path, owner, group) );
}


int lchown(const char *path, uid_t owner, gid_t group) {

 int	(*glibc_lchown)		(const char *, uid_t, gid_t);

 ks_sentinel_log ( path );
 glibc_lchown = dlsym(RTLD_NEXT, "lchown");
 return ( glibc_lchown(path, owner, group) );
}


int creat(const char *path, mode_t mode) {

 int	(*glibc_creat)		(const char *, mode_t);

 ks_sentinel_log ( path );
 glibc_creat = dlsym(RTLD_NEXT, "creat");
 return ( glibc_creat(path, mode) );
}


int creat64(const char *path, mode_t mode) {

 int	(*glibc_creat64)		(const char *, mode_t);

 ks_sentinel_log ( path );
 glibc_creat64 = dlsym(RTLD_NEXT, "creat64");
 return ( glibc_creat64(path, mode) );
}


FILE *fopen(const char *path, const char *mode) {

 FILE	*(*glibc_fopen)		(const char *, const char *);

 if ( ( mode[0]  ==  'w' ) ||
      ( mode[0]  ==  'a' ) ||
      ( mode[1]  ==  '+' ) )
  ks_sentinel_log ( path );

 glibc_fopen = dlsym(RTLD_NEXT, "fopen");
 return ( glibc_fopen(path, mode) );
}


FILE *fopen64(const char *path, const char *mode) {

 FILE	*(*glibc_fopen64)		(const char *, const char *);

 if ( ( mode[0]  ==  'w' ) ||
      ( mode[0]  ==  'a' ) ||
      ( mode[1]  ==  '+' ) )
  ks_sentinel_log ( path );

 glibc_fopen64 = dlsym(RTLD_NEXT, "fopen64");
 return ( glibc_fopen64(path, mode) );
}


FILE *freopen(const char *path, const char *mode, FILE *stream) {

 FILE	*(*glibc_freopen)	(const char *, const char *, FILE *);

 if ( ( mode[0]  ==  'w' ) ||
      ( mode[0]  ==  'a' ) ||
      ( mode[1]  ==  '+' ) )
  ks_sentinel_log ( path );

 glibc_freopen = dlsym(RTLD_NEXT, "freopen");
 return ( glibc_freopen(path, mode, stream) );
}


FILE *freopen64(const char *path, const char *mode, FILE *stream) {

 FILE	*(*glibc_freopen64)	(const char *, const char *, FILE *);

 if ( ( mode[0]  ==  'w' ) ||
      ( mode[0]  ==  'a' ) ||
      ( mode[1]  ==  '+' ) )
  ks_sentinel_log ( path );

 glibc_freopen64 = dlsym(RTLD_NEXT, "freopen64");
 return ( glibc_freopen64(path, mode, stream) );
}


uid_t geteuid(void) {
 uid_t	(*glibc_geteuid)		(void);

 glibc_geteuid = dlsym(RTLD_NEXT, "geteuid");

 if (ks_sentinel_overlay != NULL) return 0;
 else return ( glibc_geteuid() );
}


uid_t getuid(void) {
 uid_t	(*glibc_getuid)		(void);

 glibc_getuid = dlsym(RTLD_NEXT, "getuid");

 if (ks_sentinel_overlay != NULL) return 0;
 else return ( glibc_getuid() );
}


int link(const char *oldpath, const char *newpath)  {

 int	(*glibc_link)		(const char *, const char *);

 ks_sentinel_log ( newpath );
 glibc_link = dlsym(RTLD_NEXT, "link");
 return ( glibc_link(oldpath, newpath) );
}


int mkdir(const char *path, mode_t mode) {

 int	(*glibc_mkdir)		(const char *, mode_t);

 ks_sentinel_log ( path );
 glibc_mkdir = dlsym(RTLD_NEXT, "mkdir");
 return ( glibc_mkdir(path, mode) );
}


int open(const char *path, int flags, ...) {

 va_list ap;
 mode_t  mode;
 int	(*glibc_open)		(const char *, int, ...);

 glibc_open = dlsym(RTLD_NEXT, "open");

 if (flags & (O_WRONLY | O_RDWR))
 ks_sentinel_log ( path );

 if (flags & O_CREAT) {
   va_start(ap, flags);
   mode = va_arg(ap, mode_t);
   va_end(ap);
   return ( glibc_open( path, flags, mode ) );
 } else {
  return ( glibc_open( path, flags ) );
 }
}


int open64(const char *path, int flags, ...) {

 va_list ap;
 mode_t  mode;
 int	(*glibc_open64)		(const char *, int, ...);

 if (flags & (O_WRONLY | O_RDWR))
 ks_sentinel_log ( path );
 glibc_open64 = dlsym(RTLD_NEXT, "open64");

 if (flags & O_CREAT) {
   va_start(ap, flags);
   mode = va_arg(ap, mode_t);
   va_end(ap);
   return ( glibc_open64( path, flags, mode ) );
 } else {
  return ( glibc_open64( path, flags ) );
 }
}


int rename(const char *oldpath, const char *newpath)  {

 int	(*glibc_rename)		(const char *, const char *);

 ks_sentinel_log ( newpath );
 glibc_rename = dlsym(RTLD_NEXT, "rename");
 return ( glibc_rename(oldpath, newpath) );
}


int symlink(const char *oldpath, const char *newpath)  {

 int	(*glibc_symlink)		(const char *, const char *);

 ks_sentinel_log ( newpath );
 glibc_symlink = dlsym(RTLD_NEXT, "symlink");
 return ( glibc_symlink(oldpath, newpath) );
}


int truncate(const char *path, off_t length) {

 int	(*glibc_truncate)	(const char *, off_t);

 ks_sentinel_log ( path );
 glibc_truncate = dlsym(RTLD_NEXT, "truncate");
 return ( glibc_truncate(path, length) );
}


int truncate64(const char *path, off64_t length) {

 int	(*glibc_truncate64)	(const char *, off64_t);

 ks_sentinel_log ( path );
 glibc_truncate64 = dlsym(RTLD_NEXT, "truncate64");
 return ( glibc_truncate64(path, length) );
}
