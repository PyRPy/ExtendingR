#include <stdio.h>

typedef struct 
{
    char *name;
    int quantity;
} Item;

Item fruits[3] = {{"Apple", 10}, {"orange", 20}, {"pear", 30}};

void display(Item val, Item *ref);

void display(Item val, Item *ref) 
{
    printf("%s: %d\n", val.name, val.quantity);

    val.name = "banana";
    val.quantity =  40;
    printf("%s: %d\n", val.name, val.quantity);

    printf("%s: %d\n", fruits[0].name, fruits[0].quantity);

    ref->name = "peach";
    ref->quantity = 50;
    printf("%s:%d\n", fruits[0].name, fruits[0].quantity);

}

int main() 
{
    display(fruits[0], &fruits[0]);

    return 0;

}