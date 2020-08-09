#include <stdio.h>
#include <string.h>

int main()
{
    char s1[100] = "a place for everything";
    char s2[] = " and everyting in its place";
    char s3[100] = "the truth is rarely pure";
    char s4[]= " and never simple. - oscar wilde";

    strcat(s1, s2);
    printf("\n%s\n", s1);

    strncat(s3, s4, 17);
    printf("\n%s\n", s3);

    strncat(s3, (s4+17), 14);
    printf("\n%s\n", s3);

    return 0;
}