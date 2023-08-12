
class uart2_seq extends base_seq;

    `uvm_object_utils(uart2_seq)
    `uvm_declare_p_sequencer(virtual_sequencer)

    extern function new(string name="uart2_seq");
    extern virtual task body();

endclass: uart2_seq

/**************************************************
* implement
**************************************************/
function uart2_seq::new(string name="uart2_seq");
    super.new(name);
endfunction: new

task uart2_seq::body();
    // set baud
    `uvm_do_on_with(ahbl_tr, p_sequencer.ahbl_mst_sqr, {
        hsel == 1'b1;
        hwrite == 1'b1;
        addr == 16'h6000 + 16'h0010;
        wdata == 32'd100;
        htrans == NONSEQUENTIAL;
        hsize == TRANS_SIZE_32BIT;
        hburst == SINGLE;
    })
    // set interrupt and enable tx
    // #200ns;
    `uvm_do_on_with(ahbl_tr, p_sequencer.ahbl_mst_sqr, {
        hsel == 1'b1;
        hwrite == 1'b1;
        addr == 16'h6000 + 16'h0008;
        wdata == 8'b0001_0101;
        htrans == NONSEQUENTIAL;
        hsize == TRANS_SIZE_8BIT;
        hburst == SINGLE;
    })
    // set tx_data
    `uvm_do_on_with(ahbl_tr, p_sequencer.ahbl_mst_sqr, {
        hsel == 1'b1;
        hwrite == 1'b1;
        addr == 16'h6000 + 16'h0000;
        wdata == 8'b0111_0100;
        htrans == NONSEQUENTIAL;
        hsize == TRANS_SIZE_8BIT;
        hburst == SINGLE;
    })
    // clear interrupt
    `uvm_do_on_with(ahbl_tr, p_sequencer.ahbl_mst_sqr, {
        hsel == 1'b1;
        hwrite == 1'b1;
        addr == 16'h6000 + 16'h000C;
        wdata == 8'b0000_0011;
        htrans == NONSEQUENTIAL;
        hsize == TRANS_SIZE_8BIT;
        hburst == SINGLE;
    })
    #25us;
    // disable tx
    `uvm_do_on_with(ahbl_tr, p_sequencer.ahbl_mst_sqr, {
        hsel == 1'b1;
        hwrite == 1'b1;
        addr == 16'h6000 + 16'h0008;
        wdata == 8'b0000_0000;
        htrans == NONSEQUENTIAL;
        hsize == TRANS_SIZE_8BIT;
        hburst == SINGLE;
    })
endtask: body