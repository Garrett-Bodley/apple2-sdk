#include <stdio.h>
#include <stdbool.h>

int main(void)
{
  printf("Hello, World!\n");

  // This matters when compiling to a disk image
  //
  // If you don't add an infinite loop the emulator will quickly execute
  // and exit your program before you're able to see the output.
  while(true);
  return 0;
}