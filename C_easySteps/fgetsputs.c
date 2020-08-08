#include   <stdio.h>
int main()
{
    char str[51];
    printf("\neneter up to 50 chars with spaces:\n");
    fgets(str, sizeof(str), stdin);
    printf("fgets()read:");
    puts(str);
    
    printf("\nenter up to 50 chars with spaces:\n");
    scanf("%s", str);
    printf("scanf() read: %s\n", str);

    return 0;
}

// if use scanf, it only read the first word prior to a space