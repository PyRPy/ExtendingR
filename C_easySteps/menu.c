#include <stdio.h>
#include "action.c"

void menu();
void action(int option);

int main()
{
    menu();
    return 0;
}

void menu()
{
    int option;
    printf("\n\tWhat would you like to do?");
    printf("\n\t1. square a number");
    printf("\n\t2. multiply two numbers");
    printf("\n\t3. exit\n");
    scanf("%d", &option);
    action(option);

}

void action(int option)
{
    int n1, n2;
    if (option == 1)
    {
        printf("enter an integer to be squared:");
        scanf("%d", &n1);
        printf("%d x %d = %d\n", n1, n2, square(n1));
        menu();
    } else if (option == 2) {
        printf("enter two integers to multiply");
        printf("separated by a space.");
        scanf("%d", &n1); scanf("%d", &n2);
        printf("%d x %d = %d\n", n1, n2, multiply(n1, n2));
        menu();
    } else return;
    
}