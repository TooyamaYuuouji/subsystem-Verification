//------------------------------------------------------------------------------
// 对timer0进行测试
// 检查点：
// + 使用内部信号作为计数器的计数信号，不使用外部信号。开启中断

class timer0_internal_clock_seq extends base_seq;

    `uvm_object_utils(timer0_internal_clock_seq)
    `uvm_declare_p_sequencer(virtual_sequencer)

    extern function new(string name="timer0_internal_clock_seq");
    extern virtual task body();

endclass: timer0_internal_clock_seq

/**************************************************
* implement
**************************************************/
function timer0_internal_clock_seq::new(string name="timer0_internal_clock_seq");
    super.new(name);
endfunction: new

task timer0_internal_clock_seq::body();
    ahbl_single_w32_seq ahbl_sw32_seq;
    int counter_value;

    ahbl_sw32_seq = ahbl_single_w32_seq::type_id::create("ahbl_sw32_seq");
    std::randomize(counter_value) with {counter_value > 1 && counter_value < 300;};
    `uvm_info("DEBUG", $sformatf("counter_value in timer0=%d", counter_value), UVM_LOW)
    `uvm_do_with(ahbl_sw32_seq, {ahbl_sw32_seq.seq_addr == `TIMER0_RELOAD_OFFSET; ahbl_sw32_seq.seq_data == 32'd14;})
    `uvm_do_with(ahbl_sw32_seq, {ahbl_sw32_seq.seq_addr == `TIMER0_CTRL_OFFSET; ahbl_sw32_seq.seq_data == 8'b0000_1001;})
    wait(p_sequencer.sys_vif.apbsubsys_interrupt[`TIMER0_IRQ] == 1);
    `uvm_do_with(ahbl_sw32_seq, {ahbl_sw32_seq.seq_addr == `TIMER0_INTCLEAR_OFFSET; ahbl_sw32_seq.seq_data == 32'd1;})
    `uvm_do_with(ahbl_sw32_seq, {ahbl_sw32_seq.seq_addr == `TIMER0_CTRL_OFFSET; ahbl_sw32_seq.seq_data == 32'd0;})
endtask: body