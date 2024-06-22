#include <unistd.h>
#include <sys/types.h>
#include <sys/stat.h>
#include <fcntl.h>
#include <stdio.h>

int main(int argc, char *argv[]) {
    char* const command = argv[3];
    char* const in = argv[1];
    char* const out = argv[2];
    int wstatus;

    switch (fork()) {
        case -1: {
            return -1;
        }
        case 0: {
            int fdo = open(out, O_CREAT|O_WRONLY|O_TRUNC, S_IRUSR|S_IWUSR);
            if(fdo == -1) {
                perror("open out");
                exit(1);
            }

            int fdi = open(in, O_RDONLY);
            if(fdi == -1) {
                perror("open in");
                exit(1);
            }

            if(close(STDOUT_FILENO) == -1) {
                perror("close stdout");
                exit(1);
            }

            if(close(STDIN_FILENO) == -1) {
                perror("close stdin");
                exit(1);
            }

            if(dup2(fdo, STDOUT_FILENO) == -1) {
                perror("dup2 out");
                exit(1);
            }

            if(dup2(fdi, STDIN_FILENO) == -1) {
                perror("dup2 in");
                exit(1);
            }

            execvp(command, &(argv[3]));
            perror("execvp");
            exit(1);
        }
        default: {
            if(wait(&stat) == -1){
                printf(stderr, "child process did not exit in proper way\n");
                exit(1);
            }else{
                printf("child process exited\n");
            }
        }
    }
    return 0;
}