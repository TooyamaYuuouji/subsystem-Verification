/**************************************************
* define *
**************************************************/
// +define+ARM_APB_ASSERT_ON

/**************************************************
* DUT *
**************************************************/
+incdir+../dut/cmsdk_apb4_eg_slave/verilog

../dut/cmsdk_apb4_eg_slave/verilog/cmsdk_apb4_eg_slave_interface.v
../dut/cmsdk_apb4_eg_slave/verilog/cmsdk_apb4_eg_slave_reg.v
../dut/cmsdk_apb4_eg_slave/verilog/cmsdk_apb4_eg_slave.v

../dut/cmsdk_apb_timer/verilog/cmsdk_apb_timer.v

/**************************************************
* vip *
**************************************************/
// apb vip
+incdir+../vip

../vip/apb3_interface.sv
../vip/apb3_package.sv

/**************************************************
* sequence, env, test*
**************************************************/
+incdir+../seq
+incdir+../env
+incdir+../test

/**************************************************
* tb *
**************************************************/
../tb/top_pkg.sv
../tb/top_tb.sv
