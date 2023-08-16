//------------------------------------------------------------------------------
// 对timer1进行测试
// 检查点：
// + 使用内部信号作为计数器的计数信号，但将外部信号视为时钟使能信号。开启中断

class timer1_external_enable_seq extends base_seq;

    `uvm_object_utils(timer1_external_enable_seq)
    `uvm_declare_p_sequencer(virtual_sequencer)

    extern function new(string name="timer1_external_enable_seq");
    extern virtual task body();

endclass: timer1_external_enable_seq

/**************************************************
* implement
**************************************************/
function timer1_external_enable_seq::new(string name="timer1_external_enable_seq");
    super.new(name);
endfunction: new

task timer1_external_enable_seq::body();
    ahbl_single_w32_seq ahbl_sw32_seq;
    int counter_value;

    ahbl_sw32_seq = ahbl_single_w32_seq::type_id::create("ahbl_sw32_seq");
    std::randomize(counter_value) with {counter_value > 1 && counter_value < 300;};
    `uvm_info("DEBUG", $sformatf("counter_value in timer1=%d", counter_value), UVM_LOW)
    `uvm_do_with(ahbl_sw32_seq, {ahbl_sw32_seq.seq_addr == `TIMER1_RELOAD_OFFSET; ahbl_sw32_seq.seq_data == counter_value;})
    `uvm_do_with(ahbl_sw32_seq, {ahbl_sw32_seq.seq_addr == `TIMER1_CTRL_OFFSET; ahbl_sw32_seq.seq_data == 8'b0000_1011;})
    wait(p_sequencer.sys_vif.apbsubsys_interrupt[`TIMER1_IRQ] == 1);
    `uvm_do_with(ahbl_sw32_seq, {ahbl_sw32_seq.seq_addr == `TIMER1_INTCLEAR_OFFSET; ahbl_sw32_seq.seq_data == 32'd1;})
    `uvm_do_with(ahbl_sw32_seq, {ahbl_sw32_seq.seq_addr == `TIMER1_CTRL_OFFSET; ahbl_sw32_seq.seq_data == 32'd0;})
endtask: body