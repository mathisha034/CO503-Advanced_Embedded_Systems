/*
 * 	FIFO queue for shared memory communication between niosII processors
 *
 *  	DATE		: 18-08-2016
 *      AUTHOR	: Isuru Nawinne
*
*	Structure of the FIFO:
*	___________________________________________________________________________
*	| 	full	| 	empty	| 	count		|	|	|	|	|	|	|	|	|
*	| 	?	| 	?		| 	?		|	|	|	|	|	|	|	|	|
*	___________________________________________________________________________
*/


#include "FIFO_1.h"


void WRITE_FIFO_1(int *buffer)
{
	// Wait if the fifo is full
	while( IORD_32DIRECT(MEM_BASE,fullp) == 1);

	// Write the data to FIFO
	IOWR_32DIRECT(MEM_BASE,writep,*buffer);


	// Update the write pointer
	writep += UNIT_SIZE;

	// //Round back to forward(custom)
	if(writep>= STARTP + (CAPACITY * UNIT_SIZE)){
		writep = STARTP;
	}

	// Update "count" in shared mem
	int count_old = IORD_32DIRECT(MEM_BASE,countp);
	IOWR_32DIRECT(MEM_BASE,countp,count_old + 1);

	// Update the "full?" and "empty?" flags accordingly
	// Set the full flag if FIFO is now full
	if(count_old+1 == CAPACITY){
		IOWR_32DIRECT(MEM_BASE,fullp, 1);
	}
	// Reset the empty flag if FIFO now has 1 enrty
	if(count_old + 1 == 1){ //first new entry is filled
		IOWR_32DIRECT(MEM_BASE,emptyp, 0);
	}
}


void READ_FIFO_1(int *buffer)
{
	// Wait if the fifo is empty
	while( IORD_32DIRECT(MEM_BASE,emptyp) == 1);

	// Read the data
	*buffer = IORD_32DIRECT(MEM_BASE,readpp);

	// Update the read pointer
	readpp += UNIT_SIZE;

	// //Round back to forward(custom)
	if(readpp>= STARTP + (CAPACITY * UNIT_SIZE)){
		readpp = STARTP;
	}

	// Update "count" in shared mem
	int count_old = IORD_32DIRECT(MEM_BASE,countp);
	IOWR_32DIRECT(MEM_BASE,countp,count_old - 1);

	// Update the "full?" and "empty?" flags accordingly
	// Set the empty flag if FIFO is now empty
	if((count_old - 1) == 0){
		IOWR_32DIRECT(MEM_BASE,emptyp,1);
	}
	// Reset the full flag if FIFO now has 1 enrty less than capacity
	if((count_old - 1) == 15){
		IOWR_32DIRECT(MEM_BASE,fullp,0);
	}
}



//Initialization
void FIFO_1_INIT()
{
	writep = STARTP; // Initially the FIFO is empty, so start writing at the first slot
	readpp  = STARTP;
	fullp   = 0x0; // SET THIS OFFSET (If there are previous FIFOs in shared memory, use Prev Fifo's STARTP + Prev Fifo's size)
	emptyp   = fullp + 0x4;
	countp  = emptyp + 0x4;

	// Assigning values for the flags.
	IOWR_32DIRECT(MEM_BASE, fullp, 0);
	IOWR_32DIRECT(MEM_BASE, emptyp, 1); // The fifo is empty at the start
	IOWR_32DIRECT(MEM_BASE, countp, 0); // The fifo is empty at the start
}
