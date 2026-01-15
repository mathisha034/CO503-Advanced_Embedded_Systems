/*
 * 	FIFO queue for shared memory communication between niosII processors
 *
 *  	DATE		: 25-12-2025
 *      AUTHOR	: Mathisha Bandara
*
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
 * Interrupt-driven interface to Altera On-Chip FIFO
 ***********************************************************************/

#include "FIFO_1.h"
#include "sys/alt_irq.h"
#include <stdio.h>
//#include "altera_avalon_fifo_regs.h"

/* --------------------------------------------------------------------
 * Internal state (shared between ISR and main code)
 * ------------------------------------------------------------------*/
static volatile uint32_t fifo_event_flags = 0;

/* --------------------------------------------------------------------
 * FIFO interrupt service routine
 * ------------------------------------------------------------------*/
static void FIFO_1_ISR(void *context, alt_u32 id)
{
    /* Read and store FIFO event register (sticky bits) */
    fifo_event_flags =
        altera_avalon_fifo_read_event(
            FIFO_1_CSR_BASE,
            ALTERA_AVALON_FIFO_EVENT_ALL);

    /* Optional debug */
    printf("[FIFO IRQ] EVENT = 0x%02X\n", fifo_event_flags);

    /* Clear all event bits (W1C behavior) */
    altera_avalon_fifo_clear_event(
        FIFO_1_CSR_BASE,
        ALTERA_AVALON_FIFO_EVENT_ALL);
}

/* --------------------------------------------------------------------
 * FIFO initialization
 * ------------------------------------------------------------------*/
int FIFO_1_Init(void)
{
    int status;

    /* Initialize FIFO control interface
     * - Clear event register
     * - Enable desired interrupts
     * - Set almost-empty / almost-full thresholds
     */
    status = altera_avalon_fifo_init(
        FIFO_1_CSR_BASE,
        ALTERA_AVALON_FIFO_IENABLE_AF_MSK |
        ALTERA_AVALON_FIFO_IENABLE_AE_MSK,
        FIFO_1_ALMOST_EMPTY,
        FIFO_1_ALMOST_FULL);

    if (status != ALTERA_AVALON_FIFO_OK)
        return status;

    /* Register FIFO interrupt handler */
    printf("[FIFO_1_Init] Registering interrupt handler (IRQ=%d)...\n", FIFO_1_IRQ);
    
    int irq_status = alt_irq_register(
        FIFO_1_IRQ,
        NULL,
        FIFO_1_ISR);
    
    if (irq_status == 0) {
        printf("[FIFO_1_Init] Interrupt handler registered successfully.\n");
    } else {
        printf("[FIFO_1_Init] ERROR: Failed to register interrupt handler (status=%d).\n", irq_status);
        return -1;
    }

    return ALTERA_AVALON_FIFO_OK;
}

/* --------------------------------------------------------------------
 * Write one word to FIFO (interrupt-aware)
 * ------------------------------------------------------------------*/
int FIFO_1_Write(uint32_t data)
{
    /* If FIFO previously reported almost full, refuse write */
    if (fifo_event_flags & ALTERA_AVALON_FIFO_EVENT_AF_MSK)
        return -1;

    /* Attempt to write */
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
 * Read one word from FIFO (interrupt-aware)
 * ------------------------------------------------------------------*/
int FIFO_1_Read(uint32_t *data)
{
    //Debugging print

    uint32_t status_of_fifo = FIFO_1_Status();
    printf("FIFO_1_Read: Current FIFO Status = 0x%08X\n", status_of_fifo);

    //printf("FIFO_1_Read: Attempting to read from FIFO...\n"); 
    //printf("FIFO_1_Read: fifo_event_flags = 0x%02X\n", fifo_event_flags);
    //printf("ALTERA_AVALON_FIFO_EVENT_AE_MSK" " = 0x%02X\n", ALTERA_AVALON_FIFO_EVENT_AE_MSK);
    /* If FIFO previously reported almost empty, refuse read */
    if (fifo_event_flags & ALTERA_AVALON_FIFO_EVENT_AE_MSK)

        //printing result
        //printf("if condition met: fifo_event_flags & ALTERA_AVALON_FIFO_EVENT_AE_MSK\n", fifo_event_flags & ALTERA_AVALON_FIFO_EVENT_AE_MSK);
        //printf("FIFO_1_Read: FIFO is almost empty, cannot read data.\n");
        return -1;

    /* Read data */
    printf("FIFO_1_Read: Reading data from FIFO...\n");
    *data = altera_avalon_fifo_read_fifo(
                FIFO_1_READ_BASE,
                FIFO_1_CSR_BASE);
    
    printf("FIFO_1_Read: Data read from FIFO: %u\n", *data);

    printf("FIFO_1_Read: Read operation successful.\n");
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
