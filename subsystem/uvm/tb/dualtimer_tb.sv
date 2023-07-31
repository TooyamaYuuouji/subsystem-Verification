
module top_tb();

`include "uvm_macros.svh"
import uvm_pkg::*;

import apb3_package::*;

logic clk, rstn;
logic clk2;

apb3_interface apb3_if(.PCLK(clk), .PRESETn(rstn));
dut_interface dut_if(.PCLK(clk), .PRESETn(rstn));

assign dut_if.dualtimer_clk = clk2;
assign apb3_if.PREADY = 1;
assign apb3_if.PSLVERR = 1;

cmsdk_apb_dualtimers DUT(
    .PCLK(apb3_if.PCLK),
    .PRESETn(apb3_if.PRESETn),
    .PSEL(apb3_if.PSEL),
    .PADDR(apb3_if.PADDR[11:2]),
    .PENABLE(apb3_if.PENABLE),
    .PWRITE(apb3_if.PWRITE),
    .PWDATA(apb3_if.PWDATA),
    .ECOREVNUM(4'd0),
    .PRDATA(apb3_if.PRDATA),
    .TIMCLK(dut_if.dualtimer_clk),
    .TIMCLKEN1(dut_if.dualtimer_clken1),
    .TIMCLKEN2(dut_if.dualtimer_clken2),
    .TIMINT1(dut_if.dualtimer_int1),
    .TIMINT2(dut_if.dualtimer_int2),
    .TIMINTC(dut_if.dualtimer_intc)
  );

initial begin: initialization
    clk = 0;
    clk2 = 0;
    rstn = 0;
    dut_if.dualtimer_clken1 = 1;
    dut_if.dualtimer_clken2 = 1;
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
    uvm_config_db #(virtual apb3_interface)::set(uvm_root::get(), "uvm_test_top", "apb3_vif", apb3_if);
    uvm_config_db #(virtual dut_interface)::set(uvm_root::get(), "uvm_test_top", "dut_vif", dut_if);
    run_test();
end

initial begin: debug
    forever begin
        @(posedge clk);
        // `uvm_info("DEBUG", $sformatf("timer reg. nxt_curr_val=%x", DUT.nxt_curr_val), UVM_LOW)
    end
end

endmodule: top_tb