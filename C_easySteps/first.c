#include <stdio.h>
void first();
int squares5();
int cubes5();

int main()
{
    int num;
    first();
    num = square5();
    printf("5x5=%d\n", num);
    printf("5x5x5=%d\n", cube5());

    return 0;

}

void first()
{
    printf("hello from the first function\n");
}

int square5()
{
    int square = 5 * 5;
    return square;
}

int cube5()
{
    int cube = (5*5) * 5;
    return cube;
}
