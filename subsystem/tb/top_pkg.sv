
package top_pkg;

`include "uvm_macros.svh"
import uvm_pkg::*;
import ahbl_pkg::*;

`include "base_seq.sv"
`include "test_slave_seq.sv"
`include "timer0_seq.sv"
`include "timer1_seq.sv"

`include "base_env.sv"

`include "base_test.sv"
`include "test_slave_test.sv"
`include "timer0_test.sv"
`include "timer1_test.sv"

endpackage: top_pkg
