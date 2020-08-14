#include <stdio.h>
typedef struct 
{
    char *name; char *popn;
} City;

int main() 
{
    City ny, la, ch, *ptr;

    ny.name = "new york city";
    ny.popn = "8,274,527";
    printf("\n%s, population: %s\n", ny.name, ny.popn);

    ptr = &la;
    ptr->name = "los angeles";
    ptr->popn = "3,777,999";
    printf("\n%s, population: %s\n", la.name, la.popn);

    ptr = &ch;
    ptr->name = "chicago";
    ptr->popn = "2,888,666";
    printf("\n%s, population: %s\n", ptr->name, ptr->popn);
    
    return 0;

}