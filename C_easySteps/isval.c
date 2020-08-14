#include <stdio.h>
#include <string.h>
#include <ctype.h>

int main()
{
    char str[7];
    int i;
    int flag = 1;

    puts("enter six digits without any spaces...");
    gets(str);

    for (i = 0; i < 6; i++) {
        if (!isdigit(str[i])) {
            flag = 0;

            if (isalpha(str[i]))
            {
                printf("letter%c found\n", toupper(str[i]));
            } else if (ispunct(str[i]))
            {
                printf("punctuation found\n");
            } else if (isspace(str[i]))
            {
                printf("space found \n");
            }


        }
    }
    (flag) ? puts("entry valid") : puts("entry invalid");

    return 0;

}