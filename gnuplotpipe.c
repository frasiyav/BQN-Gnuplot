#include <stdio.h>

int gnuplotpipe(char* msg) {
    FILE* fp;
    if (!(fp = popen("gnuplot --persist", "w"))) {
        printf("error opening pipe\n");
        return 0;
    }
    if (fputs(msg,fp) == EOF) printf("fputs error");
    pclose(fp);
    return 1;
}
