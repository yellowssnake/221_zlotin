#ifdef RUNTIME
#define _GNU_SOURCE

#include <stdio.h>
#include <stdlib.h>
#include <dlfcn.h>

void bill(char *arg) {
    void (*billp)(char *);

    billp = dlsym(RTLD_NEXT, "bill");

    printf("bill is called\n");
}

void sam(int arg) {
    void (*samp)(int);

    samp = dlsym(RTLD_NEXT, "sam");

    printf("sam is called\n");
}
#endif