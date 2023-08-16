/**************************************************
* define *
**************************************************/
// +define+ARM_APB_ASSERT_ON

/**************************************************
* DUT *
**************************************************/
// watchdog
//+incdir+../watchdog/{dut,seq,test}
+incdir+../dut/cmsdk_apb_watchdog/verilog/
../dut/cmsdk_apb_watchdog/verilog/cmsdk_apb_watchdog_frc.v
+incdir+../seq
+incdir+../test
../dut/cmsdk_apb_watchdog/verilog/cmsdk_apb_watchdog.v

/**************************************************
* vip *
**************************************************/
// apb3 vip
+incdir+../../vip/apb3

../../vip/apb3/apb3_interface.sv
../../vip/apb3/apb3_package.sv

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
+incdir+../env
+incdir+../ral
+incdir+../seq
+incdir+../tb
+incdir+../test

../tb/dut_interface.sv
../tb/top_pkg.sv
../tb/watchdog_tb.sv
