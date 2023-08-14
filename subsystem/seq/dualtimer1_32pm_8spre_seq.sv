//
// timer1 in dualtimer, mode detail:
// + periodic model
// + interrupt enable
// + 8 stage prescale(1:256)
// + 32-bit timer
// + one-shot mode

class dualtimer1_32pm_8spre_seq extends base_seq;

    `uvm_object_utils(dualtimer1_32pm_8spre_seq)
    `uvm_declare_p_sequencer(virtual_sequencer)

    extern function new(string name="dualtimer1_32pm_8spre_seq");
    extern virtual task body();

endclass: dualtimer1_32pm_8spre_seq

/**************************************************
* implement
**************************************************/
function dualtimer1_32pm_8spre_seq::new(string name="dualtimer1_32pm_8spre_seq");
    super.new(name);
endfunction: new

task dualtimer1_32pm_8spre_seq::body();
    ahbl_single_w32_seq seq1;

    seq1 = ahbl_single_w32_seq::type_id::create("seq1");
    // 测试普通计数
    `uvm_do_with(seq1, {seq1.seq_addr == `DUALTIMER_TIMER1LOAD_OFFSET; seq1.seq_data == 32'd10;})
    `uvm_do_with(seq1, {seq1.seq_addr == `DUALTIMER_TIMER1CONTROL_OFFSET; seq1.seq_data == 8'b1110_1001;})
    `uvm_do_with(seq1, {seq1.seq_addr == `DUALTIMER_TIMER1BGLOAD_OFFSET; seq1.seq_data == 32'd30;})
    wait(p_sequencer.sys_vif.apbsubsys_interrupt[10] == 1);
    `uvm_do_with(seq1, {seq1.seq_addr == `DUALTIMER_TIMER1INTCLR_OFFSET; seq1.seq_data == 32'd1;})
    // 单次计数，如果等到一定时间后还是没有中断产生，认为计数成功，该时间为256*(30+1)*20=158720ns
    #158720ns;
    `uvm_do_with(seq1, {seq1.seq_addr == `DUALTIMER_TIMER1CONTROL_OFFSET; seq1.seq_data == 8'b0010_0000;})
endtask: body