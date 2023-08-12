
package top_pkg;

`include "uvm_macros.svh"
import uvm_pkg::*;
import ahbl_pkg::*;
`include "dut_defines.svh"


`include "virtual_sequencer.sv"

`include "base_seq.sv"
`include "ahbl_single_w32_seq.sv"
`include "test_slave_seq.sv"
`include "timer0_seq.sv"
`include "timer1_seq.sv"
`include "dualtimer_seq.sv"
`include "uart0_seq.sv"
`include "uart1_seq.sv"
`include "uart2_seq.sv"

`include "base_env.sv"

`include "base_test.sv"
`include "test_slave_test.sv"
`include "timer0_test.sv"
`include "timer1_test.sv"
`include "dualtimer_test.sv"
`include "uart0_test.sv"
`include "uart1_test.sv"
`include "uart2_test.sv"

endpackage: top_pkg
