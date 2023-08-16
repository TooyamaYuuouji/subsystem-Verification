//------------------------------------------------------------------------------
// 对dualtimer进行测试
// 检查点：
// + 使用其内部的timer2。开启中断
// ++ 模式细节：period、8级预分频（1:256）、计数期宽度为32-bit、one-shot

class dualtimer2_32p_8spre_seq extends base_seq;

    `uvm_object_utils(dualtimer2_32p_8spre_seq)
    `uvm_declare_p_sequencer(virtual_sequencer)

    extern function new(string name="dualtimer2_32p_8spre_seq");
    extern virtual task body();

endclass: dualtimer2_32p_8spre_seq

/**************************************************
* implement
**************************************************/
function dualtimer2_32p_8spre_seq::new(string name="dualtimer2_32p_8spre_seq");
    super.new(name);
endfunction: new

task dualtimer2_32p_8spre_seq::body();
    ahbl_single_w32_seq ahbl_sw32_seq;
    int counter_value;

    ahbl_sw32_seq = ahbl_single_w32_seq::type_id::create("ahbl_sw32_seq");
    // 测试普通计数
    std::randomize(counter_value) with {counter_value > 1 && counter_value < 50;};
    `uvm_info("DEBUG", $sformatf("counter_value in dualtimer(timer2) load=%d", counter_value), UVM_LOW)
    `uvm_do_with(ahbl_sw32_seq, {ahbl_sw32_seq.seq_addr == `DUALTIMER_TIMER2LOAD_OFFSET; ahbl_sw32_seq.seq_data == counter_value;})
    `uvm_do_with(ahbl_sw32_seq, {ahbl_sw32_seq.seq_addr == `DUALTIMER_TIMER2CONTROL_OFFSET; ahbl_sw32_seq.seq_data == 8'b1110_1001;})
    std::randomize(counter_value) with {counter_value > 1 && counter_value < 50;};
    `uvm_info("DEBUG", $sformatf("counter_value in dualtimer(timer2) background load=%d", counter_value), UVM_LOW)
    `uvm_do_with(ahbl_sw32_seq, {ahbl_sw32_seq.seq_addr == `DUALTIMER_TIMER2BGLOAD_OFFSET; ahbl_sw32_seq.seq_data == counter_value;})
    wait(p_sequencer.sys_vif.apbsubsys_interrupt[`DUALTIMER_IRQ] == 1);
    `uvm_do_with(ahbl_sw32_seq, {ahbl_sw32_seq.seq_addr == `DUALTIMER_TIMER2INTCLR_OFFSET; ahbl_sw32_seq.seq_data == 32'd1;})
    // 单次计数，如果等到一定时间后还是没有中断产生，认为计数成功，该时间为256*(30+1)*max(50)=396800ns
    #396800ns;
    `uvm_do_with(ahbl_sw32_seq, {ahbl_sw32_seq.seq_addr == `DUALTIMER_TIMER2CONTROL_OFFSET; ahbl_sw32_seq.seq_data == 8'b0010_0000;})
endtask: body