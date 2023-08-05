
package top_pkg;

`include "uvm_macros.svh"
import uvm_pkg::*;
import apb3_package::*;

`include "virtual_sequencer.sv"
// dualtimer
`include "ral_dualtimer.sv"
`include "dualtimer_start_seq.sv"
`include "dualtimer_clear_interrupt_seq.sv"
`include "dualtimer_stop_seq.sv"

`include "scoreboard.sv"
`include "apb3_adapter.sv"
`include "base_env.sv"

`include "base_test.sv"
`include "dualtimer_test.sv"

endpackage: top_pkg
