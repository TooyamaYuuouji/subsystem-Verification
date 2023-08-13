//
// use internal clock as counter clock and use external clock enable also
// enable interrupt

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
    ahbl_single_w32_seq seq1;

    seq1 = ahbl_single_w32_seq::type_id::create("seq1");
    `uvm_do_with(seq1, {seq1.seq_addr == `TIMER1_RELOAD_OFFSET; seq1.seq_data == 32'd14;})
    `uvm_do_with(seq1, {seq1.seq_addr == `TIMER1_CTRL_OFFSET; seq1.seq_data == 8'b0000_1011;})
    wait(p_sequencer.sys_vif.apbsubsys_interrupt[9] == 1);
    `uvm_do_with(seq1, {seq1.seq_addr == `TIMER1_INTCLEAR_OFFSET; seq1.seq_data == 32'd1;})
    `uvm_do_with(seq1, {seq1.seq_addr == `TIMER1_CTRL_OFFSET; seq1.seq_data == 32'd0;})
endtask: body