
class scoreboard extends uvm_component;

    logic[31:0] exp_counter = 'd0;
    // int res_counter = -2;
    logic start_counter = 0;
    int baud_counter = 0;
    int tx_counter = 0;
    logic[7:0] exp_tx = 'd0;
    logic[9:0] res_tx = 'd0;
    apb3_configuration config;
    ral_uart rm;
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
    
    // 使用中断而非控制信号，是因为第二次传输时无需给出控制信号，只需清除中断，dut会自动传输
    if(tr.addr == 32'h0000_000C) begin
        start_counter = tr.wdata[0];
        // `uvm_info("DEBUG", $sformatf("start_counter = %x", start_counter), UVM_LOW);
    end
    // if(tr.addr == 32'h0000_000C) begin
    //     end_counter = tr.wdata[0];
    // end
endfunction: write

task scoreboard::main_phase(uvm_phase phase);
    uvm_status_e status;
    uvm_reg_data_t value;
    bit flag = 1; // 保证后门访问只进行一次

    while(1) begin
        @(posedge dut_vif.mon_pcb.uart_baudtick);

        if(start_counter == 1 && flag == 1) begin
            rm.DATA.peek(status, value);
            exp_tx = value[7:0];
            // `uvm_info("DEBUG", $sformatf("Now exp_tx = %x", exp_tx), UVM_LOW);
            flag = 0;
        end
        if(start_counter == 1) begin
            baud_counter ++;
            if(baud_counter == 8) begin
                res_tx[tx_counter] = dut_vif.mon_pcb.uart_tx;
                // `uvm_info("DEBUG", $sformatf("Now tx = %b", dut_vif.mon_pcb.uart_tx), UVM_LOW);
                tx_counter ++;
            end
            if(baud_counter == 16) begin
                baud_counter = 0;
                // `uvm_info("DEBUG", "tx_counter clear!", UVM_LOW);
            end
        end
        if(tx_counter == 10) begin
            start_counter = 0;
            // 开始位 数据位 停止位
            if(res_tx[0] ==0 && res_tx[8:1] === exp_tx && res_tx[9] == 1) begin
                `uvm_info("CUPSUC", $sformatf("Compare pass! res_tx==exp_tx==%b", exp_tx), UVM_LOW);
            end else begin
                `uvm_info("CUPERR", $sformatf("Compare fail! res_tx = %b, exp_tx = %b", res_tx, exp_tx), UVM_LOW);
            end
            tx_counter = 0;
            flag = 1;
        end
    end
endtask: main_phase