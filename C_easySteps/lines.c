#include <stdio.h>
#include <string.h>

int main()
{
    FILE *file_ptr;
    char text[50];
    file_ptr = fopen("farewell.txt", "r+a");

    if (file_ptr != NULL) 
    {
        printf("file farewell.txt opened\n");
        while (fgets(text, 50, file_ptr)) {
            printf("%s", text);
        }

        strcpy(text, "...by Me Again");
        fputs(text, file_ptr);
        fclose(file_ptr);
        return 0;

    } else {
        printf("unable to open file\n");
        return 1;
    }
}