#include <stdlib.h>
#include "smack.h"

// @expect error

typedef struct {
  int i;
  int j;
} a;

int main(void) {
  a *x = (a*)malloc(sizeof(a));
  long *p = x;
  x->i = 10;
  x->j = 20;
  *p = 0;
  assert(x->j == 20);
  return 0;
}

