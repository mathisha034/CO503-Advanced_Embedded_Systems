/*
 * 	FIFO queue for shared memory communication between niosII processors
 *
 *  	DATE		: 25-12-2025
 *      AUTHOR		: Mathisha Bandara
*
*	Structure of the FIFO:
*	___________________________________________________________________________
*	| 	full	| 	empty	| 	count		|	|	|	|	|	|	|	|	|
*	| 	?	| 	?		| 	?		|	|	|	|	|	|	|	|	|
*	___________________________________________________________________________
*/

/***********************************************************************
 * FIFO_1.c
 *
 * Polling-based interface to Altera On-Chip FIFO
 ***********************************************************************/

#include "FIFO_1.h"
#include <stdio.h>

/* --------------------------------------------------------------------
 * FIFO initialization (polling mode)
 * ------------------------------------------------------------------*/
int FIFO_1_Init(void)
{
    int status;

    /* Initialize FIFO control interface
     * - Clear event register
     * - Disable all interrupts
     * - Set almost-empty / almost-full thresholds (optional in polling)
     */
    status = altera_avalon_fifo_init(
        FIFO_1_CSR_BASE,
        0,                      // interrupts disabled
        FIFO_1_ALMOST_EMPTY,
        FIFO_1_ALMOST_FULL);

    return status;
}

/* --------------------------------------------------------------------
 * Write one word to FIFO (polling)
 * ------------------------------------------------------------------*/
int FIFO_1_Write(uint32_t data)
{
    /* Poll FULL flag */
    if (altera_avalon_fifo_read_status(
            FIFO_1_CSR_BASE,
            ALTERA_AVALON_FIFO_STATUS_FULL))
    {
        return -1;   // FIFO full
    }

    /* Write data */
    if (altera_avalon_fifo_write_fifo(
            FIFO_1_WRITE_BASE,
            FIFO_1_CSR_BASE,
            data) != ALTERA_AVALON_FIFO_OK)
    {
        return -1;
    }

    return 0;
}

/* --------------------------------------------------------------------
 * Read one word from FIFO (polling)
 * ------------------------------------------------------------------*/
int FIFO_1_Read(uint32_t *data)
{
    /* Poll EMPTY flag */
    if (altera_avalon_fifo_read_status(
            FIFO_1_CSR_BASE,
            ALTERA_AVALON_FIFO_STATUS_EMPTY))
    {
        return -1;   // FIFO empty
    }

    /* Read data */
    *data = altera_avalon_fifo_read_fifo(
                FIFO_1_READ_BASE,
                FIFO_1_CSR_BASE);

    return 0;
}

/* --------------------------------------------------------------------
 * Utility functions
 * ------------------------------------------------------------------*/
uint32_t FIFO_1_Level(void)
{
    return altera_avalon_fifo_read_level(FIFO_1_CSR_BASE);
}

uint32_t FIFO_1_Status(void)
{
    return altera_avalon_fifo_read_status(
        FIFO_1_CSR_BASE,
        ALTERA_AVALON_FIFO_STATUS_ALL);
}
