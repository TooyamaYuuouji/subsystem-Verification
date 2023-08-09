
module top_tb();

`include "uvm_macros.svh"
import uvm_pkg::*;
import ahbl_pkg::*;

logic clk, rstn;
logic clk2;

logic apbactive;

ahbl_interface ahbl_if(.HCLK(clk), .HRESETn(rstn));
apb3_interface apb3_if(.PCLK(clk2), .PRESETn(rstn));

cmsdk_apb_subsystem #(
  .APB_EXT_PORT12_ENABLE(0),
  .APB_EXT_PORT13_ENABLE(0),
  .APB_EXT_PORT14_ENABLE(0),
  .APB_EXT_PORT15_ENABLE(0),
  .INCLUDE_IRQ_SYNCHRONIZER(0),
  .INCLUDE_APB_TEST_SLAVE(1),
  .INCLUDE_APB_TIMER0(1),
  .INCLUDE_APB_TIMER1(1),
  .INCLUDE_APB_DUALTIMER0(1),
  .INCLUDE_APB_UART0(1),
  .INCLUDE_APB_UART1(1),
  .INCLUDE_APB_UART2(1),
  .INCLUDE_APB_WATCHDOG(1),
  .BE(0)
) DUT (
    .HCLK(ahbl_if.HCLK),
    .HRESETn(ahbl_if.HRESETn),
    .HSEL(ahbl_if.HSEL),
    .HADDR(ahbl_if.HADDR),
    .HTRANS(ahbl_if.HTRANS),
    .HWRITE(ahbl_if.HWRITE),
    .HSIZE(ahbl_if.HSIZE),
    .HPROT(ahbl_if.HPROT),
    .HREADY(1'b1),
    .HWDATA(ahbl_if.HREADYOUT),
    .HREADYOUT(ahbl_if.HREADYOUT),
    .HRDATA(ahbl_if.HRDATA),
    .HRESP(ahbl_if.HRESP),
    .PCLK(apb3_if.PCLK),
    .PCLKG(1'b0),
    .PCLKEN(1'b1),
    .PRESETn(apb3_if.PRESETn),
    .PADDR(apb3_if.PADDR),
    .PWRITE(apb3_if.PWRITE),
    .PWDATA(apb3_if.PWDATA),
    .PENABLE(apb3_if.PENABLE),
    .ext12_psel(),
    .ext13_psel(),
    .ext14_psel(),
    .ext15_psel(),
    .ext12_prdata(),
    .ext12_pready(),
    .ext12_pslverr(),
    .ext13_prdata(),
    .ext13_pready(),
    .ext13_pslverr(),
    .ext14_prdata(),
    .ext14_pready(),
    .ext14_pslverr(),
    .ext15_prdata(),
    .ext15_pready(),
    .ext15_pslverr(),
    .APBACTIVE(apbactive),
    .uart0_rxd(),
    .uart0_txd(),
    .uart0_txen(),
    .uart1_rxd(),
    .uart1_txd(),
    .uart1_txen(),
    .uart2_rxd(),
    .uart2_txd(),
    .uart2_txen(),
    .timer0_extin(),
    .timer1_extin(),
    .apbsubsys_interrupt(),
    .watchdog_interrupt(),
    .watchdog_reset()
  );


initial begin: initialization
    clk = 0;
    clk2 = 0;
    rstn = 0;
end

initial begin: clk_gen
    forever begin
        #10;
        clk <= ~clk;
    end
end

initial begin: clk2_gen
    forever begin
        #30;
        clk2 <= ~clk2;
    end
end

initial begin: rstn_gen
    repeat(5) @(posedge clk);
    rstn <= 1;
end

initial begin: uvm_start
    uvm_config_db #(virtual ahbl_interface)::set(uvm_root::get(), "uvm_test_top", "ahbl_if", ahbl_if);
    uvm_config_db #(virtual apb3_interface)::set(uvm_root::get(), "uvm_test_top", "apb3_if", apb3_if);
    run_test();
end

endmodule: top_tb