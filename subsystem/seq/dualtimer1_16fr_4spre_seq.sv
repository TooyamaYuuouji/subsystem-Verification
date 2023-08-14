//
// timer1 in dualtimer, mode detail:
// + free-running model
// + interrupt enable
// + 4 stage prescale(1:16)
// + 16-bit timer

class dualtimer1_16fr_4spre_seq extends base_seq;

    `uvm_object_utils(dualtimer1_16fr_4spre_seq)
    `uvm_declare_p_sequencer(virtual_sequencer)

    extern function new(string name="dualtimer1_16fr_4spre_seq");
    extern virtual task body();

endclass: dualtimer1_16fr_4spre_seq

/**************************************************
* implement
**************************************************/
function dualtimer1_16fr_4spre_seq::new(string name="dualtimer1_16fr_4spre_seq");
    super.new(name);
endfunction: new

task dualtimer1_16fr_4spre_seq::body();
    ahbl_single_w32_seq seq1;

    seq1 = ahbl_single_w32_seq::type_id::create("seq1");
    // 测试普通计数
    `uvm_do_with(seq1, {seq1.seq_addr == `DUALTIMER_TIMER1LOAD_OFFSET; seq1.seq_data == 32'd21;})
    `uvm_do_with(seq1, {seq1.seq_addr == `DUALTIMER_TIMER1CONTROL_OFFSET; seq1.seq_data == 8'b1010_0100;})
    `uvm_do_with(seq1, {seq1.seq_addr == `DUALTIMER_TIMER1BGLOAD_OFFSET; seq1.seq_data == 32'd66;})
    wait(p_sequencer.sys_vif.apbsubsys_interrupt[10] == 1);
    `uvm_do_with(seq1, {seq1.seq_addr == `DUALTIMER_TIMER1INTCLR_OFFSET; seq1.seq_data == 32'd1;})
    // 因为此时中断信号还没结束，需要等一小段时间
    #100ns;
    // 测试bg读取失效
    wait(p_sequencer.sys_vif.apbsubsys_interrupt[10] == 1);
    `uvm_do_with(seq1, {seq1.seq_addr == `DUALTIMER_TIMER1INTCLR_OFFSET; seq1.seq_data == 32'd1;})


endtask: body