#include <stdio.h>
int main()
{
    int i;
    int nums[10] = { 1, 2, 3, 4, 5, 6, 7, 8, 9, 10 };

    int *ptr = nums;
    printf("\nAt address: %p is value: %d\n", ptr, *ptr);

    ptr++;
    printf("\nAt address: %p is value: %d\n", ptr, *ptr);

    ptr++;
    printf("\nAt address: %p is value: %d\n", ptr, *ptr);

    // go back two steps
    ptr -= 2;
    printf("\nAt address: %p is value: %d\n", ptr, *ptr);

    // add a loop to print out all elements in the array
    for (i = 0; i < 10; i++)
    {
        printf("element %d contains value: %d\n", i, *ptr);
        ptr++;
    }


    return 0;


}