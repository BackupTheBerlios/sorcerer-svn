#if defined(__x86_64__) || \
    defined(__sparc64__) || \
    defined(__arch64__) || \
    defined(__powerpc64__) || \
    defined(__s390x__)
#include "ares_build-64.h"
#else
#include "ares_build-32.h"
#endif
