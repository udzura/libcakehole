int cakehole(void);

#define _GNU_SOURCE
#include <dlfcn.h>

int listen(int sockfd, int backlog)
{
  int (*super)(int, int);
  cakehole();
  super = dlsym(RTLD_NEXT, "listen");
  return super(sockfd, backlog);
}
