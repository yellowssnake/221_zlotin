#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <regex.h>


char* regreplace(char* text, regex_t *regex, const char *replacement) {
    regmatch_t matches[1];

    char * result = NULL;
    result = (char *)malloc((strlen(text) + 1) * sizeof(char));

    if (result == NULL) {
        regfree(regex);
        return NULL;
    }
    result[0] = '\0';
    while (regexec(regex, text, 1, matches, 0) == 0) {
        char *last_match_start = text + matches[0].rm_so;

        strncat(result, text, last_match_start - text);

        strcat(result, replacement);

        text = text + matches[0].rm_eo;
    }
    strcat(result, text);

    return result;
}

int main(int argc, char *argv[]) {
    if(argc != 4){
        return 1;
    }

    char *regex_str = argv[1];
    char *text = argv[2];
    char *replacement = argv[3];
    regex_t regex;

    regcomp(&regex, regex_str, REG_EXTENDED);

    char * result = regreplace(text, &regex, replacement);
    if(result == NULL){
        return 1;
    }


    printf("%s\n", result);


    free(result);
    regfree(&regex);

    return 0;
}

