/*
 * 	Template of consumer application using FIFO
 *
 *  	DATE		: 18-08-2016
 *      AUTHOR	: Isuru Nawinne
 */


#include "FIFO_1.h"


void delay(int n);
int consumer();


int main()
{
	consumer();
	
	while(1) { }

	return 0;
}


int consumer()
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


	FIFO_1_INIT(); // Initialize the producer-consumer fifo

	int j = 0;
	int k = 5;
	while(k<500)
	{
		single_read_intial = alt_timestamp(); // take initial timestamp before read
		READ_FIFO_1(&j);  // Read from the producer-consumer fifo
		single_read_final = alt_timestamp(); // take final timestamp after read
		
		intial_read = second_read;
		second_read = single_read_final;
		(unsigned long)total_time_read_next_input = ((unsigned long)(second_read - intial_read))/((unsigned long)timer_freq);
		(unsigned long)single_total_time = ((unsigned long)(single_read_final - single_read_intial))/((unsigned long)timer_freq);
		
		if(j==k)
			printf("Consumer succefully received [%i] : SRT = %lu, PT = %lu\n",j , single_total_time, total_time_read_next_input);

		k+=10;
	}

	printf("Consumer finished..\n");
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