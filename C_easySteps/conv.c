#include <stdio.h>
#include <stdlib.h>

int main()
{
    int n1, n2, n3;
    char s1[10] = "12eight", s2[10] = "-65.8", s3[10] = "x13";

    n1= atoi(s1);
    printf("\nstring%s convert to integer: %d\n", s1, n1);

    n2= atoi(s2);
    printf("\nstring%s convert to integer: %d\n", s2, n2);

    n3= atoi(s3);
    printf("\nstring%s convert to integer: %d\n\n", s3, n3);

    // convert from integer to letters
    //itoa(n1, s1, 2);
    printf("decimal %d is binary: %s\n", n1, s1);

    n2 = sprintf(s3, "%o", n1);
    printf("decimal %d is octal: %s chars: %d\n", n1, s3, n2);
    n3 =sprintf(s3, "%x", n1);
    printf("decimal %d is hexadecimal: %s chars: %d\n", n1, s3, n3);


    return 0;


}