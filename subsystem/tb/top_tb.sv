
module top_tb();

`include "uvm_macros.svh"
import uvm_pkg::*;
import ahbl_pkg::*;

logic clk, rstn;
logic clk2, clk3;

logic pclk;
logic pclkg;
logic pclken;
logic presetn;
logic apbactive;

ahbl_interface ahbl_if(.HCLK(clk), .HRESETn(rstn));
system_interface sys_if(.sys_clk(clk), .sys_rstn(rstn));
perips_interface perips12_if(.pclk(ahbl_if.HCLK), .presetn(ahbl_if.HRESETn));
perips_interface perips13_if(.pclk(ahbl_if.HCLK), .presetn(ahbl_if.HRESETn));
perips_interface perips14_if(.pclk(ahbl_if.HCLK), .presetn(ahbl_if.HRESETn));
perips_interface perips15_if(.pclk(ahbl_if.HCLK), .presetn(ahbl_if.HRESETn));
perips_interface peripsEX_if(.pclk(ahbl_if.HCLK), .presetn(ahbl_if.HRESETn));

assign pclk = ahbl_if.HCLK;
assign pclkg = ahbl_if.HCLK;
assign pclken = 1'b1;
assign presetn = ahbl_if.HRESETn;
assign sys_if.timer0_extin = clk2;
assign sys_if.timer1_extin = clk3;

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
    .HWDATA(ahbl_if.HWDATA),
    .HREADYOUT(ahbl_if.HREADYOUT),
    .HRDATA(ahbl_if.HRDATA),
    .HRESP(ahbl_if.HRESP),
    .PCLK(pclk),
    .PCLKG(pclkg),
    .PCLKEN(pclken),
    .PRESETn(presetn),
    .PADDR(peripsEX_if.paddr[11:0]),
    .PWRITE(peripsEX_if.pwrite),
    .PWDATA(peripsEX_if.pwdata),
    .PENABLE(peripsEX_if.penable),
    .ext12_psel(perips12_if.psel),
    .ext13_psel(perips13_if.psel),
    .ext14_psel(perips14_if.psel),
    .ext15_psel(perips15_if.psel),
    .ext12_prdata(perips12_if.prdata),
    .ext12_pready(perips12_if.pready),
    .ext12_pslverr(perips12_if.pslverr),
    .ext13_prdata(perips13_if.prdata),
    .ext13_pready(perips13_if.pready),
    .ext13_pslverr(perips13_if.pslverr),
    .ext14_prdata(perips14_if.prdata),
    .ext14_pready(perips14_if.pready),
    .ext14_pslverr(perips14_if.pslverr),
    .ext15_prdata(perips15_if.prdata),
    .ext15_pready(perips15_if.pready),
    .ext15_pslverr(perips15_if.pslverr),
    .APBACTIVE(apbactive),
    .uart0_rxd(sys_if.uart0_rxd),
    .uart0_txd(sys_if.uart0_txd),
    .uart0_txen(sys_if.uart0_txen),
    .uart1_rxd(sys_if.uart1_rxd),
    .uart1_txd(sys_if.uart1_txd),
    .uart1_txen(sys_if.uart1_txen),
    .uart2_rxd(sys_if.uart2_rxd),
    .uart2_txd(sys_if.uart2_txd),
    .uart2_txen(sys_if.uart2_txen),
    .timer0_extin(sys_if.timer0_extin),
    .timer1_extin(sys_if.timer1_extin),
    .apbsubsys_interrupt(sys_if.apbsubsys_interrupt),
    .watchdog_interrupt(sys_if.watchdog_interrupt),
    .watchdog_reset(sys_if.watchdog_reset)
  );


initial begin: initialization
    clk = 0;
    clk2 = 0;
    clk3 = 0;
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
        #20;
        clk2 <= ~clk2;
    end
end

initial begin: clk3_gen
    forever begin
        #30;
        clk3 <= ~clk3;
    end
end

initial begin: rstn_gen
    repeat(5) @(posedge clk);
    rstn <= 1;
end

initial begin: uvm_start
    uvm_config_db #(virtual ahbl_interface)::set(uvm_root::get(), "uvm_test_top", "ahbl_if", ahbl_if);
    uvm_config_db #(virtual system_interface)::set(uvm_root::get(), "uvm_test_top", "sys_if", sys_if);
    run_test();
end

endmodule: top_tb