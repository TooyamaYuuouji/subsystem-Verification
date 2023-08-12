
class dualtimer_seq extends base_seq;

    `uvm_object_utils(dualtimer_seq)
    `uvm_declare_p_sequencer(virtual_sequencer)

    extern function new(string name="dualtimer_seq");
    extern virtual task body();

endclass: dualtimer_seq

/**************************************************
* implement
**************************************************/
function dualtimer_seq::new(string name="dualtimer_seq");
    super.new(name);
endfunction: new

task dualtimer_seq::body();
// `uvm_info("DEBUG", $sformatf("Can read virtual_sequencer value. test_in_vsqr=%d", p_sequencer.test_in_vsqr), UVM_LOW)
    // set value
    `uvm_do_on_with(ahbl_tr, p_sequencer.ahbl_mst_sqr, {
        hsel == 1'b1;
        hwrite == 1'b1;
        addr == 16'h2000 + 16'h0000;
        wdata == 32'd21;
        htrans == NONSEQUENTIAL;
        hsize == TRANS_SIZE_32BIT;
        hburst == SINGLE;
    })
    // start
    // #200ns;
    `uvm_do_on_with(ahbl_tr, p_sequencer.ahbl_mst_sqr, {
        hsel == 1'b1;
        hwrite == 1'b1;
        addr == 16'h2000 + 16'h0008;
        wdata == 8'b1010_0000;
        htrans == NONSEQUENTIAL;
        hsize == TRANS_SIZE_8BIT;
        hburst == SINGLE;
    })
endtask: body