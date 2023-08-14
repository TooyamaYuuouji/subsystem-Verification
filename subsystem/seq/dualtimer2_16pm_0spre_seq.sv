//
// timer2 in dualtimer, mode detail:
// + period mode
// + interrupt enable
// + 1 stage prescale(1:1)
// + 16-bit timer

class dualtimer2_16pm_0spre_seq extends base_seq;

    `uvm_object_utils(dualtimer2_16pm_0spre_seq)
    `uvm_declare_p_sequencer(virtual_sequencer)

    extern function new(string name="dualtimer2_16pm_0spre_seq");
    extern virtual task body();

endclass: dualtimer2_16pm_0spre_seq

/**************************************************
* implement
**************************************************/
function dualtimer2_16pm_0spre_seq::new(string name="dualtimer2_16pm_0spre_seq");
    super.new(name);
endfunction: new

task dualtimer2_16pm_0spre_seq::body();
    ahbl_single_w32_seq seq1;

    seq1 = ahbl_single_w32_seq::type_id::create("seq1");
    // 测试普通计数
    `uvm_do_with(seq1, {seq1.seq_addr == `DUALTIMER_TIMER2LOAD_OFFSET; seq1.seq_data == 32'd21;})
    `uvm_do_with(seq1, {seq1.seq_addr == `DUALTIMER_TIMER2CONTROL_OFFSET; seq1.seq_data == 8'b1110_0000;})
    `uvm_do_with(seq1, {seq1.seq_addr == `DUALTIMER_TIMER2BGLOAD_OFFSET; seq1.seq_data == 32'd66;})
    wait(p_sequencer.sys_vif.apbsubsys_interrupt[10] == 1);
    `uvm_do_with(seq1, {seq1.seq_addr == `DUALTIMER_TIMER2INTCLR_OFFSET; seq1.seq_data == 32'd1;})
    // 因为此时中断信号还没结束，需要等一小段时间
    #100ns;
    // 测试bg读取有效
    wait(p_sequencer.sys_vif.apbsubsys_interrupt[10] == 1);
    `uvm_do_with(seq1, {seq1.seq_addr == `DUALTIMER_TIMER2INTCLR_OFFSET; seq1.seq_data == 32'd1;})
endtask: body