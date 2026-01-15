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

    alt_u32 single_read_intial, single_read_final, single_total_time;
    alt_u32 intial_read=0, second_read=0, total_time_read_next_input=0;
    alt_u32 timer_freq;

    if(alt_timestamp_start() < 0) // starts the timestamp timer
    {
        printf("Please add the high resolution timer to the timestamp timer setting in the syslib properties page.\n");
        exit(1);
     }

    timer_freq = alt_timestamp_freq(); // gets the timer frequency

    /* ONLY producer initializes FIFO */
    if (FIFO_1_Init() != 0) {
    	printf("FIFO init failed!\n");
        while (1);
     }

    uint32_t j;
    int expected = 5;

    while (expected <= 500)
    {
    	single_read_intial = alt_timestamp(); // take initial timestamp before read
        /* Retry until read succeeds */
        while (FIFO_1_Read(&j) != 0)
            ;  // wait
        single_read_final = alt_timestamp(); // take final timestamp after read

        intial_read = second_read;
        second_read = single_read_final;
        total_time_read_next_input = (second_read - intial_read);
        single_total_time = (single_read_final - single_read_intial);

        if (j == expected)
        	printf("Consumer succefully received [%i] : SRT = %.3f us, PT = %.3f us\n",j , (1e6*(double)single_total_time)/timer_freq, (1e6*(double) total_time_read_next_input)/timer_freq);

        expected += 10;
    }

    printf("Consumer finished..\n");
    while (1);
}
