
class scoreboard extends uvm_component;

    logic[31:0] exp_counter = 'd0;
    int res_counter = -3;
    logic start_counter = 0;
    logic end_counter = 0;
    apb3_configuration config;
    virtual apb3_interface apb3_vif;
    virtual dut_interface dut_vif;
    uvm_analysis_imp #(apb3_transaction, scoreboard) mon_imp;

    `uvm_component_utils(scoreboard)

    extern function new(string name="scoreboard", uvm_component parent=null);
    extern function void build_phase(uvm_phase phase);
    extern task main_phase(uvm_phase phase);
    extern function void write(apb3_transaction tr);

endclass: scoreboard

/**************************************************
* implement
**************************************************/
function scoreboard::new(string name="scoreboard", uvm_component parent=null);
    super.new(name, parent);

    mon_imp = new("mon_imp", this);
endfunction: new

function void scoreboard::build_phase(uvm_phase phase);
    super.build_phase(phase);

    apb3_vif = config.apb3_vif;
endfunction: build_phase

function void scoreboard::write(apb3_transaction tr);
    // `uvm_info("DEBUG", $sformatf("Check pkt in scoreboard. Current time:%t", $realtime), UVM_LOW);
    // tr.print();
    if(tr.addr == 32'h0000_0008) begin
        exp_counter = tr.wdata;
    end
    if(tr.addr == 32'h0000_0000) begin
        start_counter = tr.wdata[0];
    end
    if(tr.addr == 32'h0000_000C) begin
        end_counter = tr.wdata[0];
    end
endfunction: write

task scoreboard::main_phase(uvm_phase phase);
    while(1) begin
        @(apb3_vif.mon_pcb);
        if(start_counter == 1) begin
            // `uvm_info("DEBUG", $sformatf("in sb, counter value=%d", exp_counter), UVM_LOW);
            res_counter ++;
        end
        if(end_counter == 1) begin
            `uvm_info("DEBUG", $sformatf("in sb, res_counter = %d", res_counter), UVM_LOW);
            if(res_counter == exp_counter) begin
                `uvm_info("CUPSUC", "Compare pass!", UVM_LOW);
            end else begin
                `uvm_error("CUPERROR", $sformatf("Compare fail! exp_counter=%d, res_counter=%d", exp_counter, res_counter));
            end
            end_counter = 0;
        end
    end
endtask: main_phase