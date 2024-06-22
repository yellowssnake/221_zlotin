#include <unistd.h>
#include <sys/wait.h>
#include <stdio.h>
#include <stdlib.h>
#include <errno.h>

void errExit(const char* err) {
    perror(err);
    exit(EXIT_FAILURE);
}

int main(int argc, char *argv[]) {
    int pfd[2];
    char* const command1 = argv[1];
    char* const command2 = argv[2];

    if (pipe(pfd) == -1)
        errExit("pipe");

    pid_t pid1, pid2;

    pid1 = fork();
    if(pid1 == -1)
        errExit("fork");

    if(pid1 == 0) {
        if (close(pfd[0]) == -1)
            errExit("close 1");

        if (pfd[1] != STDOUT_FILENO) {
            if (dup2(pfd[1], STDOUT_FILENO) == -1)
                errExit("dup2 1");
            if (close(pfd[1]) == -1)
                errExit("close 2");
        }

        execlp(command1, command1, (char *) NULL);
        errExit("execlp command1");
    }

    pid2 = fork();
    if(pid2 == -1)
        errExit("fork");

    if(pid2 == 0) {
        if (close(pfd[1]) == -1)
            errExit("close 3");

        if (pfd[0] != STDIN_FILENO) {
            if (dup2(pfd[0], STDIN_FILENO) == -1)
                errExit("dup2 2");
            if (close(pfd[0]) == -1)
                errExit("close 4");
        }

        execvp(command2, &(argv[2]));
        errExit("execvp command2");
    }

    if (close(pfd[0]) == -1)
        errExit("close 5");
    if (close(pfd[1]) == -1)
        errExit("close 6");

    int wstatus;
    pid_t wpid;
    while ((wpid = wait(&wstatus)) > 0 || (wpid == -1 && errno == EINTR));

    if(errno != ECHILD)
        errExit("wait");

    exit(EXIT_SUCCESS);
}