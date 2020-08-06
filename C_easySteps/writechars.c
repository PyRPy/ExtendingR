#include <stdio.h>
int main()
{
    FILE *file_ptr;
    int i;
    char text[50] = { "text, one character at a time."};
    file_ptr = fopen("chars.txt", "w");

    if (file_ptr != NULL) 
    {
        printf("file chars.txt created\n");
        for (i = 0; text[i]; i++) {
            fputc(text[i], file_ptr);
        }
        fclose(file_ptr);
        return 0;
    } else {
        printf("unable to create file\n");
        return 1;
    }
}