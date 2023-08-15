
class ahbl_single_r32_seq extends base_seq;

    `uvm_object_utils(ahbl_single_r32_seq)
    `uvm_declare_p_sequencer(virtual_sequencer)

    rand logic[15:0] seq_addr;

    extern function new(string name="ahbl_single_r32_seq");
    extern virtual task body();

endclass: ahbl_single_r32_seq

/**************************************************
* implement
**************************************************/
function ahbl_single_r32_seq::new(string name="ahbl_single_r32_seq");
    super.new(name);
endfunction: new

task ahbl_single_r32_seq::body();
    `uvm_do_on_with(ahbl_tr, p_sequencer.ahbl_mst_sqr, {
        hsel == 1'b1;
        hwrite == 1'b0;
        addr == seq_addr;
        htrans == NONSEQUENTIAL;
        hsize == TRANS_SIZE_32BIT;
        hburst == SINGLE;
    })
endtask: body