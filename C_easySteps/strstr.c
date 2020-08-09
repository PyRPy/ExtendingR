#include <stdio.h>
#include <string.h>

int main()
{
    char str[] = "no time like the present";
    char sub[] = "time";

    if(strstr(str, sub) == NULL)
    {
        printf("substring\"time\" not found\n");
    } else {
        printf("substring \"time\" found at %p\n", strstr(str, sub));
        printf("element index number %d\n\n", strstr(str, sub) - str);
    }

    printf("%s versus \"Time\": %d\n", sub, strcmp(sub, "Time"));
    printf("%s versus \"time\": %d\n", sub, strcmp(sub, "time"));
    printf("%s versus \"TIME\": %d\n", sub, strcmp(sub, "TIME"));

    return 0;

}