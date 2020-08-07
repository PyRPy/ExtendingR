#include <stdio.h>
int main()
{
    int num = 8;
    int *ptr = &num;

    printf("regular variable contains: %d\n", num);
    printf("pointer variable contains:0x%dp\n", ptr);
    printf("pointer points to value: %d\n\n", *ptr);
    
    *ptr = 12;
    printf("regular variable contains: %d\n", num);
    printf("pointer variable contains:0x%dp\n", ptr);
    printf("pointer points to value: %d\n\n", *ptr);

    return 0;

}