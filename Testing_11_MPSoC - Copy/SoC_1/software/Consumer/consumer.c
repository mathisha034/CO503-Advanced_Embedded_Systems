/*
 * 	Template of consumer application using FIFO
 *
 *  	DATE		: 18-08-2016
 *      AUTHOR	: Isuru Nawinne
 */

#include "FIFO_1.h"
#include <stdio.h>

int main(void)
{
    printf("Consumer starting..\n");

    uint32_t j;
    int expected = 5;

    while (expected <= 500)
    {
        /* Retry until read succeeds */
        while (FIFO_1_Read(&j) != 0)
            ;  // wait

        if (j == expected)
            printf("Consumer successfully received [%d]\n", j);

        expected += 10;
    }

    printf("Consumer finished..\n");
    while (1);
}
