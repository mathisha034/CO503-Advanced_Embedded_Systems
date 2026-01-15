/*
 * 	Template of producer application using FIFO
 *
 *  	DATE		: 18-08-2016
 *      AUTHOR	: Isuru Nawinne
 */


#include "FIFO_1.h"
#include <stdio.h>

void delay(int n);

int main(void)
{
    printf("Producer starting..\n");

    /* ONLY producer initializes FIFO */
    if (FIFO_1_Init() != 0) {
        printf("FIFO init failed!\n");
        while (1);
    }

    int j = 5;
    while (j <= 500)
    {
        delay(100000);

        /* Retry until write succeeds */
        while (FIFO_1_Write(j) != 0)
            ;  // wait (or sleep)

        printf("Producer sent [%d]\n", j);
        j += 10;
    }

    printf("Producer finished..\n");
    while (1);
}

void delay(int n)
{
	volatile int i=n;
    for ( i= n; i > 0; i--) ;
}
