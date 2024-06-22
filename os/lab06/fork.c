#include <sys/types.h>
#include <stdio.h>
#include <unistd.h>
#include <sys/wait.h>

int main() {
    pid_t pid1, pid2;
    pid1 = fork();
    if (pid1 < 0) {
        perror("Fork Failed");
        return 1;
    } else if (pid1 == 0) {
        printf("start1\n");

        pid2 = fork();

        if (pid2 < 0) {
            perror("Fork Failed");
            return 1;
        } else if (pid2 == 0) {
            printf("start2\n");
        } else {
            wait(NULL);
            printf("%d complete\n", pid2);
        }
    } else {
        wait(NULL);
        printf("%d Complete\n", pid1);
    }
    return 0;
}