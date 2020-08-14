#include <stdio.h>

typedef struct
{
    int x;
    int y;
} Point;

typedef struct 
{
    Point a;
    Point b;
} Box;


Point top = {15, 24};
Point btm;

Box rect = {6, 12, 30, 20};

int main()
{
    btm.x = 5;
    btm.y = 8;

    printf("\ntop x: %d, y: %d\n", top.x, top.y);
    printf("bottom x: %d, y: %d\n", btm.x, btm.y);

    printf("\nPoint a x: %d", rect.a.x);
    printf("\nPoint a y: %d", rect.a.y);
    printf("\nPoint b x: %d", rect.b.x);
    printf("\nPoint b y: %d\n", rect.b.y);

    return 0;
}
