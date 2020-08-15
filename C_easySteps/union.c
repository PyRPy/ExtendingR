#include <stdio.h>
typedef struct 
{
    int num;
    char ltr, *str;
} Distinct;

typedef union 
{
    int num;
    char ltr, *str;
} Unified;

int main()
{
    Distinct sdata = {10, 'C', "program"};
    Unified udata;

    printf("\nStructure:\nNumber: %d", sdata.num);
    printf("\tStored at: %p\n", &sdata.num);
    printf("letter:%c", sdata.ltr);
    printf("\tstored at: %p\n", &sdata.ltr);
    printf("string: %s", sdata.str);
    printf("\tstored at: %p\n", &sdata.str);

    udata.num = 16;
    printf("\nunion: \nnumber: %d", udata.num);
    printf("\tstored at: %p\n", &udata.num);

    udata.ltr = 'A';
    printf("letter: %c", udata.ltr);
    printf("\tstored at: %p\n", &udata.ltr);

    udata.str = "union";
    printf("string: %s", udata.str);
    printf("\tstored at: %p\n", &udata.str);

    return 0;

}