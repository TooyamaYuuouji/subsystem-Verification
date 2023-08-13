//
// use internal clock as counter clock and use external clock enable also
// enable interrupt

class timer0_external_enable_seq extends base_seq;

    `uvm_object_utils(timer0_external_enable_seq)
    `uvm_declare_p_sequencer(virtual_sequencer)

    extern function new(string name="timer0_external_enable_seq");
    extern virtual task body();

endclass: timer0_external_enable_seq

/**************************************************
* implement
**************************************************/
function timer0_external_enable_seq::new(string name="timer0_external_enable_seq");
    super.new(name);
endfunction: new

task timer0_external_enable_seq::body();
    ahbl_single_w32_seq seq1;

    seq1 = ahbl_single_w32_seq::type_id::create("seq1");
    `uvm_do_with(seq1, {seq1.seq_addr == `TIMER0_RELOAD_OFFSET; seq1.seq_data == 32'd14;})
    `uvm_do_with(seq1, {seq1.seq_addr == `TIMER0_CTRL_OFFSET; seq1.seq_data == 8'b0000_1011;})
    wait(p_sequencer.sys_vif.apbsubsys_interrupt[8] == 1);
    `uvm_do_with(seq1, {seq1.seq_addr == `TIMER0_INTCLEAR_OFFSET; seq1.seq_data == 32'd1;})
    `uvm_do_with(seq1, {seq1.seq_addr == `TIMER0_CTRL_OFFSET; seq1.seq_data == 32'd0;})
endtask: body