#include <stdio.h>
#include <stdlib.h>

int main()
{
    unsigned int array[5];


    printf("Please, enter 5 unsigned decimal numbers from 0 to 255 inclusively:\n");
    for (int i = 0; i < 5; i++) scanf("%hhu", &array[i]);

    printf("\n\nEntered numbers (decimal):\n");
    for (int i = 0; i < 5; i++) printf("%hhu ", array[i]);
    printf("\n");

    for (int i = 0; i < 5; i++) array[i] = (array[i] + 'M' + i ^ 'Z') % 256;

    printf("\nResult (decimal):\n");
    for (int i = 0; i < 5; i++) printf("%hhu ", array[i]);
    printf("\n\nPress any key...\n");
    getch();

    return 0;
}
