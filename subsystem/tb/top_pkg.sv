
package top_pkg;

`include "uvm_macros.svh"
import uvm_pkg::*;
import ahbl_pkg::*;
`include "dut_defines.svh"


`include "func_cov.sv"
`include "virtual_sequencer.sv"

`include "base_seq.sv"
`include "ahbl_single_w32_seq.sv"
`include "ahbl_single_r32_seq.sv"
`include "test_slave_seq.sv"
`include "timer0_internal_clock_seq.sv"
`include "timer0_external_clock_seq.sv"
`include "timer0_external_enable_seq.sv"
`include "timer1_internal_clock_seq.sv"
`include "timer1_external_clock_seq.sv"
`include "timer1_external_enable_seq.sv"
`include "dualtimer1_16p_0spre_seq.sv"
`include "dualtimer1_16fr_4spre_seq.sv"
`include "dualtimer1_32p_8spre_seq.sv"
`include "dualtimer2_16p_0spre_seq.sv"
`include "dualtimer2_16fr_4spre_seq.sv"
`include "dualtimer2_32p_8spre_seq.sv"
`include "uart0_single_tx_seq.sv"
`include "uart0_continue_tx_seq.sv"
`include "uart0_single_rx_seq.sv"
`include "uart0_continue_rx_seq.sv"
`include "uart1_single_tx_seq.sv"
`include "uart1_continue_tx_seq.sv"
`include "uart1_single_rx_seq.sv"
`include "uart1_continue_rx_seq.sv"
`include "uart2_single_tx_seq.sv"
`include "uart2_continue_tx_seq.sv"
`include "uart2_single_rx_seq.sv"
`include "uart2_continue_rx_seq.sv"

`include "scoreboard.sv"
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
