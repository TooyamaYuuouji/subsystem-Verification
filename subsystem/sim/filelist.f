/**************************************************
* define *
**************************************************/
// +define+ARM_APB_ASSERT_ON

/**************************************************
* DUT *
**************************************************/
// timer
//+incdir+../timer/{dut,seq,test}
+incdir+../timer/dut
+incdir+../timer/seq
+incdir+../timer/test
../timer/dut/cmsdk_apb_timer/verilog/cmsdk_apb_timer.v

/**************************************************
* vip *
**************************************************/
// apb3 vip
+incdir+../vip/apb3

../vip/apb3/apb3_interface.sv
../vip/apb3/apb3_package.sv

/**************************************************
* sequence, env, test*
**************************************************/
//+incdir+../seq
//+incdir+../env
//+incdir+../test

/**************************************************
* uvm and tb *
**************************************************/
//+incdir+../uvm/{ral,tb,test}
+incdir+../uvm/test
+incdir+../uvm/ral

../uvm/tb/top_pkg.sv
../uvm/tb/top_tb.sv
