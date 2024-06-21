# ifdef LINKTIME
#include <stdio.h>
#include <stdlib.h>
#include <dlfcn.h>

void __real_fred(void);
void __real_john(void);
void __wrap_fred(void)
{
    printf("fred called\n");
}

void __wrap_john(void)
{
    printf("john called\n");
}
#endif