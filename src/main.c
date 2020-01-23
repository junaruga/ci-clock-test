#include <stdio.h>
#include <string.h>
#include <time.h>

int main(void)
{
    struct timespec tp;

    memset(&tp, 0, sizeof(struct timespec));
    if (clock_gettime(CLOCK_BOOTTIME, &tp) == -1) {
        perror("clock_gettime CLOCK_BOOTTIME");
        return 1;
    }
    memset(&tp, 0, sizeof(struct timespec));
    if (clock_gettime(CLOCK_TAI, &tp) == -1) {
        perror("clock_gettime CLOCK_TAI");
        return 1;
    }
    printf("Done successfully.\n");

    return 0;
}
