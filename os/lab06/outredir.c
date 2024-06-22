#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <fcntl.h>

int main(int argc, char *argv[]) {
    if (argc < 3) {
        return 1;
    }

    int fd = open(argv[2], O_WRONLY | O_CREAT | O_TRUNC, 0644);
    if (fd == -1) {
        perror("Error opening file");
        return 1;
    }

    if (dup2(fd, STDOUT_FILENO) == -1) {
        perror("Error redirecting stdout");
        return 1;
    }

    execlp(argv[1], argv[1], NULL);

    perror("Error executing command");
    return 1;
}