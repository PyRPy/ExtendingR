#include <windows.h>
#include <stdio.h>
#include <stdlib.h>
#include <time.h>
#include <string.h>

int WINAPI WinMail(HINSTANCE hInstance, HINSTANCE hPrevInstance, LPSTR lpChmdLine, int nCmdShow)
{
    int i, r, temp, nums[60];
    char buf[4], str[100] = {"your six luck numbers are: "};
    
    srand(time(NULL));

    for (i = 0; i < 60; i++) { nums[i] = i;}

    for (i = 1; i < 60; i++)
    {
        r = (rand() % 59) + 1;
        temp = nums[i];
        nums[i] = nums[r];
        nums[r] = temp;
    }

    for (i = 1; i < 7; i++)
    {
        sprintf(buf, "%d", nums[i]);
        strcat(buf, " "); 
        strcat(str, buf);
    }

    // printf("\n%s\n\n", str);
    MessageBox(NULL, str, "Lotto number picker", MB_OK|MB_ICONEXCLAMATION);
    
    return 0;
}
