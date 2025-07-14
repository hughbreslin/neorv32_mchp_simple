/*******************************************************************************
 * Copyright 2019 Microchip FPGA Embedded Systems Solutions.
 *
 * SPDX-License-Identifier: MIT
 *
 * @file main.c
 * @author Microchip FPGA Embedded Systems Solutions
 * @brief Application demonstrating the use of CoreGPIO driver. Please see
 * the README.md for more details.
 *
 */

//#include <drivers/fpga_ip/CoreUARTapb/core_uart_apb.h>
//#include "fpga_design_config/fpga_design_config.h"
//#include "miv_rv32_hal/miv_rv32_hal.h"
#include <stdlib.h>
#include <neorv32.h>

/*******************************************************************************
 * Types, Constants and Greetings messages
 *******************************************************************************/

#define APB_BUS_WIDTH   GPIO_APB_32_BITS_BUS
#define RX_BUFF_SIZE    64U
#define HIGH            1u
#define LOW             0U

//UART_instance_t g_uart;

/* delay in ms */
static void delay(uint8_t t_in_ms);

#include <stdint.h>
#include <stdbool.h> // For bool type

volatile bool g_benchmark_timer_expired = false;

// --- GLOBAL BENCHMARK VARIABLES ---
// These need to be global or accessible to the interrupt handler and main function.
volatile uint32_t g_loop_iterations_count = 0; // Use uint64_t for large counts
volatile float g_benchmark_result_accumulator = 0.0f; // Accumulate result to prevent optimization
void gptmr_firq_handler(void);
// --- TIMER INTERRUPT HANDLER PLACEHOLDER ---
// You will hook this function (or your actual handler) into your timer's interrupt vector.
// This is critical for the benchmark to stop.
void gptmr_firq_handler(void) {
    // Clear the timer's interrupt flag (crucial for proper operation)
    // Example: TIMER_REG->ISR |= TIMER_ISR_FLAG_Msk; (depends on your timer peripheral)

    g_benchmark_timer_expired = true;
    neorv32_gptmr_irq_ack(); // clear pending timer-internal interrupt
}

// --- BENCHMARK FUNCTION ---

/**
 * @brief Runs a floating-point benchmark for a fixed duration.
 * @param duration_seconds The desired duration of the benchmark in seconds.
 * @param flops_per_iteration The number of floating-point operations performed in ONE loop iteration.
 * You MUST determine this accurately for your specific arithmetic.
 * @return The calculated FLOPs (Floating Point Operations Per Second).
 * Returns 0.0f if the timer could not be initialized.
 */

void delay_ms(uint32_t time_ms) {
  neorv32_aux_delay_ms(neorv32_sysinfo_get_clk(), time_ms);
}

uint32_t run_flops_benchmark(uint32_t duration_seconds, float flops_per_iteration) {
    if (flops_per_iteration <= 0.0f) {
        // Avoid division by zero and illogical input
        return 0.0f;
    }

    g_loop_iterations_count = 0;
    g_benchmark_result_accumulator = 0.0f; // Reset accumulator for each run
    g_benchmark_timer_expired = false;

    // Convert seconds to milliseconds for timer setup
    uint32_t duration_ms = duration_seconds * 1000;

    // check if GPTMR unit is implemented at all
    if (neorv32_gptmr_available() == 0) {
      neorv32_uart0_puts("ERROR! General purpose timer not implemented!\n");
      return 1;
    }
    neorv32_rte_handler_install(GPTMR_TRAP_CODE, gptmr_firq_handler);
    neorv32_gptmr_setup(CLK_PRSC_8, 124999999/10);
    neorv32_cpu_csr_set(CSR_MIE, 1 << GPTMR_FIRQ_ENABLE);   // enable GPTMR FIRQ channel
    neorv32_cpu_csr_set(CSR_MSTATUS, 1 << CSR_MSTATUS_MIE); // enable machine-mode interrupts

    // Initialize the hardware timer to trigger the interrupt
//    if (!platform_timer_init_for_interrupt(duration_ms)) {
//        // Handle error: timer couldn't be set up
//        return 0.0f;
//    }

    // Optional: Add a small delay to ensure the timer is fully started before the loop
    delay(1);

    // --- CORE BENCHMARK LOOP ---
    // This loop runs until the timer interrupt sets the flag
    volatile float val1 = 1.0f;
    volatile float val2 = 0.5f;
    volatile float val3 = 2.0f;
    volatile float val4 = 0.75f;

    while (!g_benchmark_timer_expired) {
        // Example: 4 FLOPs per iteration (1 mul, 1 div, 1 add, 1 sub)
        // Make sure to adapt this to match your `flops_per_iteration` value.
        g_benchmark_result_accumulator = g_benchmark_result_accumulator + (val1 * val2) / val3 - val4;

        // Introduce small changes to inputs to prevent excessive compiler optimization
        // and ensure the operations are actually performed each time.
        val1 += 0.00001f;
        val2 -= 0.000005f;
        val3 *= 1.000001f;
        val4 /= 1.000002f;

        g_loop_iterations_count++;
    }

    // Benchmark finished! The timer interrupt fired.

    // Calculate total FLOPs performed
    uint32_t total_flops_performed = (uint32_t)(g_loop_iterations_count * (uint32_t)flops_per_iteration);

    // Calculate FLOPs per second
    // Since `duration_seconds` is in seconds, simply divide total_flops_performed by it.
    uint32_t flops_per_second = total_flops_performed / duration_seconds;

    // You might want to do something with g_benchmark_result_accumulator here
    // e.g., print it, or use it in a dummy way, to ensure the compiler doesn't
    // optimize away the entire loop thinking `g_benchmark_result_accumulator` is unused.
    // For example: if (g_benchmark_result_accumulator > 1e10) { /* do nothing */ }

    return flops_per_second;
}

// --- EXAMPLE USAGE IN YOUR MAIN ---
/*
int main(void) {
    // You would call your platform's initialization routines here
    // e.g., SystemInit();
    //       init_gpio_for_leds();
    //       init_uart_for_debug_output();

    float my_flops_per_iteration = 4.0f; // For the example arithmetic loop: (A*B)/C - D + E...
                                        // Carefully determine this value based on your actual loop.

    uint32_t benchmark_duration_s = 10; // Run for 10 seconds

    // Print initial message (if you have UART/debug output)
    // printf("Starting FLOPs benchmark for %u seconds...\n", benchmark_duration_s);

    float calculated_flops = run_flops_benchmark(benchmark_duration_s, my_flops_per_iteration);

    // Print results (if you have UART/debug output)
    // printf("Benchmark finished.\n");
    // printf("Total iterations: %llu\n", g_loop_iterations_count);
    // printf("Accumulated result: %f (use for anti-optimization)\n", g_benchmark_result_accumulator);
    // printf("Calculated FLOPs/second: %.2f GFLOPs\n", calculated_flops / 1e9f); // Convert to GFLOPs

    while (1) {
        // Main application loop or just stay here
    }
}
*/
void irq_0_handler (void) {
    neorv32_uart0_printf("\n<< IRQ 0 >>\n\n");
}

void irq_1_handler (void) {
    neorv32_uart0_printf("\n<< IRQ 1 >>\n\n");
}

void irq_2_handler (void) {
    neorv32_uart0_printf("\n<< IRQ 2 >>\n\n");
}

void irq_3_handler (void) {
    neorv32_uart0_printf("\n<< IRQ 3 >>\n\n");
}

void irq_4_handler (void) {
    neorv32_uart0_printf("\n<< IRQ 4 >>\n\n");
}

void irq_5_handler (void) {
    neorv32_uart0_printf("\n<< IRQ 5 >>\n\n");
}

void irq_6_handler (void) {
    neorv32_uart0_printf("\n<< IRQ 6 >>\n\n");
}

void irq_7_handler (void) {
    neorv32_uart0_printf("\n<< IRQ 7 >>\n\n");
}

void gpio_interrupt_handler(void) {
    volatile uint32_t irq = neorv32_gpio_irq_get();
    if (irq & (1 << 0)) {
        irq_0_handler();
        neorv32_gpio_irq_clr((1 << 0));
        irq = irq & ~(1 << 0);
    }
    if (irq & (1 << 1)) {
        irq_1_handler();
        neorv32_gpio_irq_clr((1 << 1));
        irq = irq & ~(1 << 1);
    }
    if (irq & (1 << 2)) {
        irq_2_handler();
        neorv32_gpio_irq_clr((1 << 2));
        irq = irq & ~(1 << 2);
    }
    if (irq & (1 << 3)) {
        irq_3_handler();
        neorv32_gpio_irq_clr((1 << 3));
        irq = irq & ~(1 << 3);
    }
    if (irq & (1 << 4)) {
        irq_4_handler();
        neorv32_gpio_irq_clr((1 << 4));
        irq = irq & ~(1 << 4);
    }
    if (irq & (1 << 5)) {
        irq_5_handler();
        neorv32_gpio_irq_clr((1 << 5));
        irq = irq & ~(1 << 5);
    }
    if (irq & (1 << 6)) {
        irq_6_handler();
        neorv32_gpio_irq_clr((1 << 6));
        irq = irq & ~(1 << 6);
    }
    if (irq & (1 << 7)) {
            irq_7_handler();
            neorv32_gpio_irq_clr((1 << 7));
            irq = irq & ~(1 << 7);
        }

}

/*******************************************************************************
 * main
 *******************************************************************************/

void main(void);
#define MAX_DUTY 200
void main()
{
    // setup NEORV32 runtime-environment (RTE)
    neorv32_rte_setup();

    // setup UART0 at default baud rate, no interrupts
    if (neorv32_uart0_available() == 0) { // UART0 available?
      //return -1;
    }
    neorv32_uart0_setup(9600, 0);
    neorv32_uart0_printf("\n<< NEORV32 Simple SMP Dual-Core Demo >>\n\n");

//    while(1){};
//
//    // check hardware/software configuration
//    if (neorv32_gpio_available() == 0) { // GPIO available?
//      neorv32_uart0_printf("[ERROR] GPIO module not available!\n");
//      while(1){};
//    }
//
//    // configure GPIO input's IRQ trigger
//    uint32_t irq;
//    for (irq=0; irq<8; irq+=1) {
//      //neorv32_gpio_irq_setup(i+0, GPIO_TRIG_LEVEL_HIGH);    // this pin's interrupt fires on low-level
//      //neorv32_gpio_irq_setup(i+1, GPIO_TRIG_LEVEL_HIGH);   // this pin's interrupt fires on high-level
//      //neorv32_gpio_irq_setup(i+2, GPIO_TRIG_EDGE_FALLING); // this pin's interrupt fires on a falling edge
//      neorv32_gpio_irq_setup(irq, GPIO_TRIG_EDGE_RISING);  // this pin's interrupt fires on a rising edge
//    }
//    // enable all GPIO input pin interrupts
//    neorv32_gpio_irq_enable(0xff); // argument is an "enable bit mask" - one bit for each input pin
//
//    // configure CPU's GPIO controller interrupt
//    neorv32_rte_handler_install(GPIO_TRAP_CODE, gpio_interrupt_handler); // install GPIO trap handler
    neorv32_cpu_csr_set(CSR_MIE, 1 << GPIO_FIRQ_ENABLE); // enable GPIO FIRQ channel
    neorv32_cpu_csr_set(CSR_MSTATUS, 1 << CSR_MSTATUS_MIE); // enable machine-mode interrupts



    // check if PWM unit is implemented at all
    if (neorv32_pwm_available() == 0) {
      if (neorv32_uart0_available()) {
        neorv32_uart0_printf("ERROR: PWM module not implemented!\n");
      }
      while(1){

      }
    }

    int num_pwm_channels = neorv32_pmw_get_num_channels();

    // get number of implemented PWM channels
    if (neorv32_uart0_available()) {
      neorv32_uart0_printf("Implemented PWM channels: %i\n\n", num_pwm_channels);
    }

    // deactivate/clear all available channels
    int i;
    for (i=0; i<num_pwm_channels; i++) {
      neorv32_pwm_ch_disable(i);
      neorv32_pwm_ch_set_clock(i, 0, 0);
      neorv32_pwm_ch_set_duty(i, 0);
    }

    // configure all available channels
    for (i=0; i<num_pwm_channels; i++) {
      neorv32_pwm_ch_set_clock(i, CLK_PRSC_64, 0);
      neorv32_pwm_ch_enable(i);
    }

    // simple animation: "pulse" channels one by one
    neorv32_uart0_printf("Starting animation...\n");

    int dc = 0; // current duty cycle
    int up = 1; // up/down (increase/decrease)
    int ch = 0; // current channel

    while (1) {

      // update duty cycle
      if (up) {
        if (dc >= (int)(MAX_DUTY)) { // maximum intensity reached?
          up = 0;
        }
        else {
          dc++;
        }
      }
      else {
        if (dc == 0) {
            neorv32_uart0_printf("\n<< Channel %i >>\n\n", ch);
          // goto next channel
          if ((ch + 1) >= num_pwm_channels) {
            ch = 0;
          }
          else {
            ch++;
          }
          up = 1;
        }
        else {
          dc--;
        }
      }

      neorv32_pwm_ch_set_duty(ch, dc); // set new duty cycle for channel
      delay_ms(1); // wait ~3ms using busy-wait

    }

//    while(1){
//        neorv32_uart0_printf("\n<< Flopping >>\n\n");
//
//        volatile float my_flops_per_iteration = 4.0f; // For the example arithmetic loop: (A*B)/C - D + E...
//                                                // Carefully determine this value based on your actual loop.
//
//        volatile uint32_t benchmark_duration_s = 1; // Run for 10 seconds
//
//
//        uint32_t calculated_flops = run_flops_benchmark(benchmark_duration_s, my_flops_per_iteration);
//
//        neorv32_uart0_printf("Flops calculated: \n");
//        neorv32_uart0_printf("Total flops: 0x%x", calculated_flops);
//    }


//    UART_polled_tx_string(&g_uart, "flops done");

    /* The CoreGPIO IP instantiated in the reference designs provided on github
     * is configured to have GPIO_0 to GPIO_3 ports as outputs.
     * This configuration can not be changed by the firmware since it is fixed in
     * the CoreGPIO IP instance. In your Libero design, if you do not make
     * the GPIO configurations 'fixed', then you will need to configure them
     * using GPIO_config() function.
     *
     * The Renode GPIO instances do not use 'fixed' configurations and
     * therefore these GPIO's have to be configured at runtime.
     * Please uncomment following lines when targeting Renode:
     */
     // GPIO_config(&g_gpio, 0, GPIO_OUTPUT_MODE);
     // GPIO_config(&g_gpio, 1, GPIO_OUTPUT_MODE);

}

/* delay in ms */
static void delay(uint8_t t_in_ms)
{
    uint32_t loopcount = (t_in_ms * neorv32_sysinfo_get_clk())/1000U;
    for (volatile int count  = 0 ; count < loopcount ; count++)
    {

    }
}
