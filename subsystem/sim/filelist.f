/**************************************************
* define *
**************************************************/
// +define+ARM_APB_ASSERT_ON

/**************************************************
* DUT *
**************************************************/
// timer
+incdir+../../perips/timer/dut/cmsdk_apb_timer/verilog
../../perips/timer/dut/cmsdk_apb_timer/verilog/cmsdk_apb_timer.v
// dualtimer
+incdir+../../perips/dualtimer/dut/cmsdk_apb_dualtimers/verilog
../../perips/dualtimer/dut/cmsdk_apb_dualtimers/verilog/cmsdk_apb_dualtimers_frc.v
../../perips/dualtimer/dut/cmsdk_apb_dualtimers/verilog/cmsdk_apb_dualtimers.v
// watchdog
+incdir+../../perips/watchdog/dut/cmsdk_apb_watchdog/verilog
../../perips/watchdog/dut/cmsdk_apb_watchdog/verilog/cmsdk_apb_watchdog_frc.v
../../perips/watchdog/dut/cmsdk_apb_watchdog/verilog/cmsdk_apb_watchdog.v
// uart
+incdir+../../perips/uart/dut/cmsdk_apb_uart/verilog
../../perips/uart/dut/cmsdk_apb_uart/verilog/cmsdk_apb_uart.v
// mux
+incidr+../dut/cmsdk_apb_slave_mux/verilog
../dut/cmsdk_apb_slave_mux/verilog/cmsdk_apb_slave_mux.v
// bridge
+incidr+../dut/cmsdk_ahb_to_apb/verilog
../dut/cmsdk_ahb_to_apb/verilog/cmsdk_ahb_to_apb.v
// subsystem
+incidr+../dut/cmsdk_apb_subsystem/verilog
../dut/cmsdk_apb_subsystem/verilog/cmsdk_apb_test_slave.v
../dut/cmsdk_apb_subsystem/verilog/cmsdk_irq_sync.v
../dut/cmsdk_apb_subsystem/verilog/cmsdk_apb_subsystem.v

/**************************************************
* vip *
**************************************************/
// apb3 vip
+incdir+../vip/apb3

../vip/apb3/apb3_interface.sv
../vip/apb3/apb3_package.sv

// ahbl vip
+incdir+../vip/ahbl

../vip/ahbl/ahbl_interface.sv
../vip/ahbl/ahbl_pkg.sv

/**************************************************
* sequence, env, test*
**************************************************/
//+incdir+../seq
+incdir+../env
+incdir+../test

/**************************************************
* tb *
**************************************************/
../tb/top_pkg.sv
../tb/top_tb.sv
