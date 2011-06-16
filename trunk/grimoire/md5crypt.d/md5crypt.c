/*
# Copyright Kyle Sallee 2011
# All rights reserved.
# For use with the distribution sorcerer only!
*/

#define _XOPEN_SOURCE
#include <unistd.h>
#include <error.h>

#include <stdio.h>
#include <stdlib.h>

int main(int argc, char *argv[])
{
 char *line	= NULL;
 char salt[]	= "$1$NaCl$";
 size_t len	= 0;

 while ((getline(&line, &len, stdin)) != -1) {
  puts(crypt(line,salt));
  free(line);
  line=NULL;
 }
}
