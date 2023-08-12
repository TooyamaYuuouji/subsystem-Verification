
class timer1_seq extends base_seq;

    `uvm_object_utils(timer1_seq)
    `uvm_declare_p_sequencer(virtual_sequencer)

    extern function new(string name="timer1_seq");
    extern virtual task body();

endclass: timer1_seq

/**************************************************
* implement
**************************************************/
function timer1_seq::new(string name="timer1_seq");
    super.new(name);
endfunction: new

task timer1_seq::body();
`uvm_info("DEBUG", $sformatf("Can read virtual_sequencer value. test_in_vsqr=%d", p_sequencer.test_in_vsqr), UVM_LOW)
    // set value
    `uvm_do_on_with(ahbl_tr, p_sequencer.ahbl_mst_sqr, {
        hsel == 1'b1;
        hwrite == 1'b1;
        addr == 16'h1000 + 16'h0008;
        wdata == 32'd14;
        htrans == NONSEQUENTIAL;
        hsize == TRANS_SIZE_16BIT;
        hburst == SINGLE;
    })
    // start
    #200ns;
    `uvm_do_on_with(ahbl_tr, p_sequencer.ahbl_mst_sqr, {
        hsel == 1'b1;
        hwrite == 1'b1;
        addr == 16'h1000 + 16'h0000;
        wdata == 8'b0000_1001;
        htrans == NONSEQUENTIAL;
        hsize == TRANS_SIZE_8BIT;
        hburst == SINGLE;
    })
endtask: body