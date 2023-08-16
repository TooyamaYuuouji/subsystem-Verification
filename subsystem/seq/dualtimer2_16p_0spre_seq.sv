//------------------------------------------------------------------------------
// 对dualtimer进行测试
// 检查点：
// + 使用其内部的timer2。开启中断
// ++ 模式细节：period、1级预分频（1:1）、计数期宽度为16-bit

class dualtimer2_16p_0spre_seq extends base_seq;

    `uvm_object_utils(dualtimer2_16p_0spre_seq)
    `uvm_declare_p_sequencer(virtual_sequencer)

    extern function new(string name="dualtimer2_16p_0spre_seq");
    extern virtual task body();

endclass: dualtimer2_16p_0spre_seq

/**************************************************
* implement
**************************************************/
function dualtimer2_16p_0spre_seq::new(string name="dualtimer2_16p_0spre_seq");
    super.new(name);
endfunction: new

task dualtimer2_16p_0spre_seq::body();
    ahbl_single_w32_seq ahbl_sw32_seq;
    int counter_value;

    ahbl_sw32_seq = ahbl_single_w32_seq::type_id::create("ahbl_sw32_seq");
    // 测试普通计数
    std::randomize(counter_value) with {counter_value > 1 && counter_value < 300;};
    `uvm_info("DEBUG", $sformatf("counter_value in dualtimer(timer2) load=%d", counter_value), UVM_LOW)
    `uvm_do_with(ahbl_sw32_seq, {ahbl_sw32_seq.seq_addr == `DUALTIMER_TIMER2LOAD_OFFSET; ahbl_sw32_seq.seq_data == counter_value;})
    `uvm_do_with(ahbl_sw32_seq, {ahbl_sw32_seq.seq_addr == `DUALTIMER_TIMER2CONTROL_OFFSET; ahbl_sw32_seq.seq_data == 8'b1110_0000;})
    std::randomize(counter_value) with {counter_value > 1 && counter_value < 300;};
    `uvm_info("DEBUG", $sformatf("counter_value in dualtimer(timer2) background load=%d", counter_value), UVM_LOW)
    `uvm_do_with(ahbl_sw32_seq, {ahbl_sw32_seq.seq_addr == `DUALTIMER_TIMER2BGLOAD_OFFSET; ahbl_sw32_seq.seq_data == counter_value;})
    wait(p_sequencer.sys_vif.apbsubsys_interrupt[`DUALTIMER_IRQ] == 1);
    `uvm_do_with(ahbl_sw32_seq, {ahbl_sw32_seq.seq_addr == `DUALTIMER_TIMER2INTCLR_OFFSET; ahbl_sw32_seq.seq_data == 32'd1;})
    // 因为此时中断信号还没结束，需要等一小段时间
    #100ns;
    // 测试bg有效
    wait(p_sequencer.sys_vif.apbsubsys_interrupt[`DUALTIMER_IRQ] == 1);
    `uvm_do_with(ahbl_sw32_seq, {ahbl_sw32_seq.seq_addr == `DUALTIMER_TIMER2INTCLR_OFFSET; ahbl_sw32_seq.seq_data == 32'd1;})
endtask: body