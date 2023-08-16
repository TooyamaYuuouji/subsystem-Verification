//------------------------------------------------------------------------------
// 对uart0进行测试
// 检查点：
// + 接收单个数据帧。开启中断

class uart0_single_rx_seq extends base_seq;

    `uvm_object_utils(uart0_single_rx_seq)
    `uvm_declare_p_sequencer(virtual_sequencer)

    extern function new(string name="uart0_single_rx_seq");
    extern virtual task body();

endclass: uart0_single_rx_seq

/**************************************************
* implement
**************************************************/
function uart0_single_rx_seq::new(string name="uart0_single_rx_seq");
    super.new(name);
endfunction: new

task uart0_single_rx_seq::body();
    ahbl_single_w32_seq ahbl_sw32_seq;
    ahbl_single_r32_seq ahbl_sr32_seq;

    ahbl_sw32_seq = ahbl_single_w32_seq::type_id::create("ahbl_sw32_seq");
    ahbl_sr32_seq = ahbl_single_r32_seq::type_id::create("ahbl_sr32_seq");
    // set baud
    `uvm_do_with(ahbl_sw32_seq, {ahbl_sw32_seq.seq_addr == `UART0_BAUDDIV_OFFSET; ahbl_sw32_seq.seq_data == 32'd100;})
    // set mode
    `uvm_do_with(ahbl_sw32_seq, {ahbl_sw32_seq.seq_addr == `UART0_CTRL_OFFSET; ahbl_sw32_seq.seq_data == 8'b0010_1010;})
    // receive rx
    p_sequencer.sys_vif.simulate_rx(100);
    // wait and clear interrupt
    wait(p_sequencer.sys_vif.apbsubsys_interrupt[`UART0_RX_INT_IRQ] == 1);
    `uvm_do_with(ahbl_sw32_seq, {ahbl_sw32_seq.seq_addr == `UART0_INTCLEAR_OFFSET; ahbl_sw32_seq.seq_data == 4'b0010;})
    // disable uart
    `uvm_do_with(ahbl_sw32_seq, {ahbl_sw32_seq.seq_addr == `UART0_CTRL_OFFSET; ahbl_sw32_seq.seq_data == 8'b0000_0000;})
    // read rx value
    `uvm_do_with(ahbl_sr32_seq, {ahbl_sr32_seq.seq_addr == `UART0_DATA_OFFSET;})
endtask: body