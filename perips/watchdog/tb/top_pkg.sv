package top_pkg;

`include "uvm_macros.svh"
import uvm_pkg::*;
import apb3_package::*;

`include "virtual_sequencer.sv"
// watchdog
`include "ral_watchdog.sv"
`include "watchdog_start_seq.sv"
`include "watchdog_clear_interrupt_seq.sv"
`include "watchdog_paddr_read_x_seq.sv"

//`include "scoreboard.sv"
`include "apb3_adapter.sv"
`include "base_env.sv"

`include "watchdog_base_test.sv"
`include "watchdog_test.sv"

endpackage: top_pkg