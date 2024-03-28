#include <stdio.h>
#include <stdbool.h>

int main(void)
{
  printf("Hello, World!");
  // This matters for compiling to disk image
  // If you don't add an infinite loop it will 
  while(true);
  return 0;
}