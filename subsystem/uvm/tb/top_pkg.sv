
package top_pkg;

`include "uvm_macros.svh"
import uvm_pkg::*;
import apb3_package::*;

`include "virtual_sequencer.sv"
// timer
`include "timer_start_seq.sv"
`include "timer_clear_interrupt_seq.sv"
`include "timer_stop_seq.sv"
// dualtimer
`include "dualtimer_start_seq.sv"
`include "dualtimer_clear_interrupt_seq.sv"
`include "dualtimer_stop_seq.sv"
// watchdog
`include "watchdog_start_seq.sv"
`include "watchdog_clear_interrupt_seq.sv"

`include "perips_scoreboard.sv"
`include "perips_env.sv"
`include "perips_base_test.sv"

`include "timer_test.sv"
`include "dualtimer_test.sv"
`include "watchdog_test.sv"

endpackage: top_pkg
