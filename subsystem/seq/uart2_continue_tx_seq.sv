//------------------------------------------------------------------------------
// 对uart2进行测试
// 检查点：
// + 发送多个数据帧，检测overrun中断。开启中断

class uart2_continue_tx_seq extends base_seq;

    `uvm_object_utils(uart2_continue_tx_seq)
    `uvm_declare_p_sequencer(virtual_sequencer)

    extern function new(string name="uart2_continue_tx_seq");
    extern virtual task body();

endclass: uart2_continue_tx_seq

/**************************************************
* implement
**************************************************/
function uart2_continue_tx_seq::new(string name="uart2_continue_tx_seq");
    super.new(name);
endfunction: new

task uart2_continue_tx_seq::body();
    ahbl_single_w32_seq ahbl_sw32_seq;
    ahbl_single_r32_seq ahbl_sr32_seq;
    logic[7:0] tx_value;

    ahbl_sw32_seq = ahbl_single_w32_seq::type_id::create("ahbl_sw32_seq");
    ahbl_sr32_seq = ahbl_single_r32_seq::type_id::create("ahbl_sr32_seq");
    // set baud
    `uvm_do_with(ahbl_sw32_seq, {ahbl_sw32_seq.seq_addr == `UART2_BAUDDIV_OFFSET; ahbl_sw32_seq.seq_data == 32'd100;})
    // set mode
    `uvm_do_with(ahbl_sw32_seq, {ahbl_sw32_seq.seq_addr == `UART2_CTRL_OFFSET; ahbl_sw32_seq.seq_data == 8'b0001_0101;})
    // load tx value
    std::randomize(tx_value);
    `uvm_info("DEBUG", $sformatf("tx_value in uart2=%b", tx_value), UVM_LOW)
    `uvm_do_with(ahbl_sw32_seq, {ahbl_sw32_seq.seq_addr == `UART2_DATA_OFFSET; ahbl_sw32_seq.seq_data == tx_value;})
    // wait and clear interrupt
    wait(p_sequencer.sys_vif.apbsubsys_interrupt[`UART2_TX_INT_IRQ] == 1);
    `uvm_do_with(ahbl_sw32_seq, {ahbl_sw32_seq.seq_addr == `UART2_INTCLEAR_OFFSET; ahbl_sw32_seq.seq_data == 4'b0001;})
    #10us;
    // more tx value
    while(p_sequencer.sys_vif.apbsubsys_interrupt[`UART2_OVERFLOW_INT_IRQ] != 1) begin
        `uvm_do_with(ahbl_sr32_seq, {ahbl_sr32_seq.seq_addr == `UART2_STATE_OFFSET;}) // 查看 interrupt寄存器情况
        std::randomize(tx_value);
        `uvm_info("DEBUG", $sformatf("tx_value in uart2=%b", tx_value), UVM_LOW)
        `uvm_do_with(ahbl_sw32_seq, {ahbl_sw32_seq.seq_addr == `UART2_DATA_OFFSET; ahbl_sw32_seq.seq_data == tx_value;})
    end
    // clear overrun interrupt
    `uvm_do_with(ahbl_sw32_seq, {ahbl_sw32_seq.seq_addr == `UART2_INTCLEAR_OFFSET; ahbl_sw32_seq.seq_data == 4'b0100;})
    // continue tx
    wait(p_sequencer.sys_vif.apbsubsys_interrupt[`UART2_TX_INT_IRQ] == 1);
    `uvm_do_with(ahbl_sw32_seq, {ahbl_sw32_seq.seq_addr == `UART2_INTCLEAR_OFFSET; ahbl_sw32_seq.seq_data == 4'b0001;})
    #20us;
endtask: body