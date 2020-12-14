#include <sys/types.h>
#include <unistd.h>
#include <signal.h>

int cakehole(void)
{
  int sigcakehole = SIGRTMAX - 4;
  signal(sigcakehole, SIG_IGN);
  return kill(getpid(), sigcakehole);
}
