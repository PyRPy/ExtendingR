#include <stdio.h>
#include <stdlib.h>

int malloc_size(int *bytes);

int main()
{
    int size, *mem;

    mem = malloc(100 * sizeof(int));

    if (mem != NULL) 
    {
        size = malloc_size(mem);
        printf("\nsize of block for 100 ints: %d bytes\n", size);
        printf("beginning at %p \n", mem);
    } else 
    {
        printf("!!! insufficient memeory \n");
        return 1;
    }

    mem = realloc(mem, size + (100 * sizeof(int)));
    if (mem != NULL)
    {
        size = malloc_size(mem);
        printf("\nsize of block for 200 ints: %d bytes\n", size);
        printf("beginning at %p\n", mem);
    } else 
    {
        printf("!!! insufficient memory\n");
        return 1;
    }

    free(mem);
    return 0;
}

// https://stackoverflow.com/questions/1281686/determine-size-of-dynamically-allocated-memory-in-c