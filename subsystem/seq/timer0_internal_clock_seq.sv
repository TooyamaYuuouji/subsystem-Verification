//
// use internal clock as counter clock and no external clock enable

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
    ahbl_single_w32_seq seq1;

    seq1 = ahbl_single_w32_seq::type_id::create("seq1");
    `uvm_do_with(seq1, {seq1.seq_addr == `TIMER0_RELOAD_OFFSET; seq1.seq_data == 32'd14;})
    // #200ns;
    `uvm_do_with(seq1, {seq1.seq_addr == `TIMER0_CTRL_OFFSET; seq1.seq_data == 8'b0000_1001;})
    `uvm_info("DEBUG", $sformatf("in timer0_internal_clock_seq, test_for_timer0_seq=%d", p_sequencer.test_for_timer0_seq), UVM_LOW)
    #200ns;

    // // set value
    // `uvm_do_with(ahbl_tr, {
    //     hsel == 1'b1;
    //     hwrite == 1'b1;
    //     addr == 16'h0000 + 16'h0008;
    //     wdata == 32'd14;
    //     htrans == NONSEQUENTIAL;
    //     hsize == TRANS_SIZE_16BIT;
    //     hburst == SINGLE;
    // })
    // // start
    // #200ns;
    // `uvm_do_with(ahbl_tr, {
    //     hsel == 1'b1;
    //     hwrite == 1'b1;
    //     addr == 16'h0000 + 16'h0000;
    //     wdata == 8'b0000_1001;
    //     htrans == NONSEQUENTIAL;
    //     hsize == TRANS_SIZE_8BIT;
    //     hburst == SINGLE;
    // })
endtask: body