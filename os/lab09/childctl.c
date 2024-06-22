#include <stdio.h>
#include <wait.h>
#include <signal.h>
#include <unistd.h>
#include <stdlib.h>
#include <string.h>

const char* sig_names[30] = {
        "HUP", "INT", "QUIT", "ILL", "TRAP", "ABRT", "BUS", "FPE", "KILL", "USR1",
        "SEGV", "USR2", "PIPE", "ALRM", "TERM", "STKFLT",
        "CHLD", "CONT", "STOP", "TSTP", "TTIN",
        "TTOU", "URG", "XCPU", "XFSZ", "VTALRM", "PROF", "WINCH", "POLL", "PWR SYS"
};

const int num_sigs = 3;

void handler(int sig) {
    printf("signal ");
    printf(strsignal(sig));
    printf("\n");
}

void exit_handler(int sig) {
    --num_sigs;
    printf("Exit signal ");
    printf(strsignal(sig));
    printf("\n");
    if(num_sigs > 0){
        exit(0);
    }
}

int main(int argc, char *argv[]) {
    int stat;
    pid_t pid;
    int sleep_time = atoi(argv[1]);
    pid = fork();
    if(pid == -1){
        exit(1);
    }
    if (pid == 0) {
        for(int j = 0; j < 30; ++j) {
            if(!strcmp(argv[2], sig_names[j])) {
                if(signal(j + 1, exit_handler) == SIG_ERR){
                    exit(1);
                }
            }
        }
        for(int i = 3; i < argc; ++i) {
            for(int j = 0; j < 30; ++j) {
                if(!strcmp(argv[i], sig_names[j])) {
                    if(signal(j + 1, handler) == SIG_ERR){
                        exit(1);
                    }
                }
            }
        }
        for (int j = 0;; ++j) {
            sleep(sleep_time);
            printf("%d: %d\n", pid, j);
        }
    } else {
        printf("Forking a child: %d\n", pid);
        if(wait(&stat) == -1){
            exit(1);
        };
        printf("And finally…\n");

        if (WIFSIGNALED(stat)) {
            psignal(WTERMSIG(stat), "Terminated:");
        }
        printf("Exit status: %d\n", stat);
    }
    return 0;
}