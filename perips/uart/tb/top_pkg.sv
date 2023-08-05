
package top_pkg;

`include "uvm_macros.svh"
import uvm_pkg::*;
import apb3_package::*;

`include "virtual_sequencer.sv"
// uart
`include "ral_uart.sv"
`include "uart_start_seq.sv"
`include "uart_set_bauddiv_seq.sv"
`include "uart_set_tx_data_seq.sv"
`include "uart_clear_interrupt_seq.sv"

`include "scoreboard.sv"
`include "apb3_adapter.sv"
`include "base_env.sv"

`include "base_test.sv"
`include "uart_test.sv"

endpackage: top_pkg
