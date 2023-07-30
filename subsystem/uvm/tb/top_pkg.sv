
package top_pkg;

`include "uvm_macros.svh"
import uvm_pkg::*;
import apb3_package::*;

`include "virtual_sequencer.sv"
`include "timer_start_seq.sv"
`include "timer_clear_interrupt_seq.sv"
`include "timer_stop_seq.sv"
//`include "virtual_sequence.sv"

`include "perips_scoreboard.sv"
`include "perips_env.sv"
`include "perips_base_test.sv"
`include "timer_test.sv"

endpackage: top_pkg
