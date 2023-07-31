/**************************************************
* define *
**************************************************/
// +define+ARM_APB_ASSERT_ON

/**************************************************
* DUT *
**************************************************/
// timer
//+incdir+../timer/{dut,seq,test}
+incdir+../timer/dut/cmsdk_apb_timer/verilog
+incdir+../timer/seq
+incdir+../timer/test
../timer/dut/cmsdk_apb_timer/verilog/cmsdk_apb_timer.v
// dualtimer
+incdir+../dualtimer/dut/cmsdk_apb_dualtimers/verilog
+incdir+../dualtimer/seq
+incdir+../dualtimer/test
../dualtimer/dut/cmsdk_apb_dualtimers/verilog/cmsdk_apb_dualtimers_frc.v
../dualtimer/dut/cmsdk_apb_dualtimers/verilog/cmsdk_apb_dualtimers.v

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

../uvm/tb/dut_interface.sv
../uvm/tb/top_pkg.sv
//../uvm/tb/timer_tb.sv
../uvm/tb/dualtimer_tb.sv
