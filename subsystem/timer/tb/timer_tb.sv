
module timer_tb();

`include "uvm_macros.svh"
import uvm_pkg::*;

import apb3_package::*;

logic clk, rstn;
logic clk2;

apb3_interface apb3_if(.PCLK(clk), .PRESETn(rstn));
dut_interface dut_if(.PCLK(clk), .PRESETn(rstn));

cmsdk_apb_timer DUT(
    .PCLK(apb3_if.PCLK),
    .PCLKG(apb3_if.PCLKG),
    .PRESETn(apb3_if.PRESETn),
    .PSEL(apb3_if.PSEL),
    .PADDR(apb3_if.PADDR[11:2]),
    .PENABLE(apb3_if.PENABLE),
    .PWRITE(apb3_if.PWRITE),
    .PWDATA(apb3_if.PWDATA),
    .ECOREVNUM(4'd0),
    .PRDATA(apb3_if.PRDATA),
    .PREADY(apb3_if.PREADY),
    .PSLVERR(apb3_if.PSLVERR),
    .EXTIN(clk2),
    .TIMERINT(dut_if.timer_int)
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

endmodule: timer_tb