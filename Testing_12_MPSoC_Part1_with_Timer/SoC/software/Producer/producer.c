/*
 * 	Template of producer application using FIFO
 *
 *  	DATE		: 18-08-2016
 *      AUTHOR	: Isuru Nawinne
 */


#include "FIFO_1.h"


void delay(int n);
int producer();


int main()
{
	producer();

	while(1) { }

	return 0;
}


int producer()
{
	printf("Producer starting..\n");

	alt_u32 single_write_intial, single_write_final, single_total_time;
	alt_u32 intial_write=0, second_write=0, total_time_write_next_input=0;
	alt_u32 timer_freq;

	if(alt_timestamp_start() < 0) // starts the timestamp timer
  	{
    	printf("Please add the high resolution timer to the timestamp timer setting in the syslib properties page.\n");
    	exit(1);
  	}

	timer_freq = alt_timestamp_freq(); // gets the timer frequency

	FIFO_1_INIT(); // Initialize the FIFO

	int j = 5;
	while(j<=500)
	{
		delay(100000);
		single_write_intial = alt_timestamp(); // take initial timestamp before write
		WRITE_FIFO_1(&j); // Write to the producer-consumer fifo
		single_write_final = alt_timestamp(); // take final timestamp after write
		delay(100000);

		intial_write = second_write;
		second_write = single_write_final;
		total_time_write_next_input = (unsigned long)(second_write - intial_write);
		single_total_time = (single_write_final - single_write_intial);

		printf("Producer sent [%i] : SWT = %.3f us , PT = %.3f us\n",j ,1e6*(double)single_total_time/timer_freq, 1e6*(double)total_time_write_next_input/timer_freq);
		j+=10;
	}

	printf("Producer finished..\n");
	return 0;
}


void delay(int n)
{
	int i;
	for(i=n; i>0; i--)
	{
		continue;
	}
}
