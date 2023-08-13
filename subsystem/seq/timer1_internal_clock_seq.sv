//
// use internal clock as counter clock and no external clock enable
// enable interrupt

class timer1_internal_clock_seq extends base_seq;

    `uvm_object_utils(timer1_internal_clock_seq)
    `uvm_declare_p_sequencer(virtual_sequencer)

    extern function new(string name="timer1_internal_clock_seq");
    extern virtual task body();

endclass: timer1_internal_clock_seq

/**************************************************
* implement
**************************************************/
function timer1_internal_clock_seq::new(string name="timer1_internal_clock_seq");
    super.new(name);
endfunction: new

task timer1_internal_clock_seq::body();
    ahbl_single_w32_seq seq1;

    seq1 = ahbl_single_w32_seq::type_id::create("seq1");
    `uvm_do_with(seq1, {seq1.seq_addr == `TIMER1_RELOAD_OFFSET; seq1.seq_data == 32'd14;})
    `uvm_do_with(seq1, {seq1.seq_addr == `TIMER1_CTRL_OFFSET; seq1.seq_data == 8'b0000_1001;})
    wait(p_sequencer.sys_vif.apbsubsys_interrupt[9] == 1);
    `uvm_do_with(seq1, {seq1.seq_addr == `TIMER1_INTCLEAR_OFFSET; seq1.seq_data == 32'd1;})
    `uvm_do_with(seq1, {seq1.seq_addr == `TIMER1_CTRL_OFFSET; seq1.seq_data == 32'd0;})
endtask: body