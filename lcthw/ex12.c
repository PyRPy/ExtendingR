#include <stdio.h>
int main(int argc, char *argv[])
{
    int areas[] = { 10, 12, 13, 14, 20 };
    char name[] = "zed";
    char full_name[] = {
        'Z', 'e', 'd',
        ' ', 'A', '.', ' ',
        'S', 'h', 'a', 'w', '\0'
    };
    printf("the size of an int: %1d\n", sizeof(int));
    printf("the size of areas (int[]): %1d\n", sizeof(areas));
    printf("the number of ints in areas: %1d\n", sizeof(areas)/sizeof(int));
    printf("the first area is %d, the 2nd %d.\n", areas[0], areas[1]);
    printf("the size of a char: %1d\n", sizeof(char));
    printf("The size of name (char[]): %ld\n", sizeof(name));
    printf("The number of chars: %ld\n", sizeof(name) / sizeof(char));
    printf("The size of full_name (char[]): %ld\n", sizeof(full_name));
    printf("The number of chars: %ld\n",
            sizeof(full_name) / sizeof(char));

    full_name[12] = 'X';
    printf("name=\"%s\" and full_name=\"%s\"\n", name, full_name);
    
    return 0;

}