#include <unistd.h>
#include <sys/types.h>
#include <sys/stat.h>
#include <fcntl.h>

int main(int argc, char *argv[]) {
    char* const command = argv[1];
    char* const in = argv[2];
    char* const out = argv[3];
    int wstatus;

    switch (fork()) {
        case -1: {
            return -1;
        }
        case 0: {
            int fdo = open(out, O_CREAT|O_WRONLY|O_TRUNC, S_IRUSR|S_IWUSR);
            int fdi = open(in, O_RDONLY);
            close(STDOUT_FILENO);
            close(STDIN_FILENO);
            dup2(fd, STDOUT_FILENO);
            dup2(fd, STDIN_FILENO);
            execlp(command, command, NULL);
            break;
        }
        default: {
            wait(&wstatus);
            printf("WEXITSTATUS(%d)\n", wstatus);
            break;
        }
    }
    return 0;
}