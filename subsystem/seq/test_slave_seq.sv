
class test_slave_seq extends base_seq;

    `uvm_object_utils(test_slave_seq)

    extern function new(string name="test_slave_seq");
    extern virtual task body();

endclass: test_slave_seq

/**************************************************
* implement
**************************************************/
function test_slave_seq::new(string name="test_slave_seq");
    super.new(name);
endfunction: new

task test_slave_seq::body();
    // `uvm_do_with(ahbl_tr, {
    //     hsel == 1'b1;
    //     hwrite == 1'b1;
    //     addr == 16'hB000;
    //     wdata == 32'd0;
    //     htrans == NONSEQUENTIAL;
    //     hsize == TRANS_SIZE_32BIT;
    //     hburst == SINGLE;
    // })
    // #200ns;
    // `uvm_do_with(ahbl_tr, {
    //     hsel == 1'b1;
    //     hwrite == 1'b1;
    //     addr == 16'hB000 + 16'h0004;
    //     wdata == 32'd0;
    //     htrans == NONSEQUENTIAL;
    //     hsize == TRANS_SIZE_32BIT;
    //     hburst == SINGLE;
    // })
    // #200ns;
    // `uvm_do_with(ahbl_tr, {
    //     hsel == 1'b1;
    //     hwrite == 1'b1;
    //     addr == 16'hB000 + 16'h0008;
    //     wdata == 32'd0;
    //     htrans == NONSEQUENTIAL;
    //     hsize == TRANS_SIZE_32BIT;
    //     hburst == SINGLE;
    // })
    // #200ns;
    // `uvm_do_with(ahbl_tr, {
    //     hsel == 1'b1;
    //     hwrite == 1'b1;
    //     addr == 16'hB000 + 16'h000C;
    //     wdata == 32'd0;
    //     htrans == NONSEQUENTIAL;
    //     hsize == TRANS_SIZE_32BIT;
    //     hburst == SINGLE;
    // })

    ahbl_single_w32_seq seq1;

    seq1 = ahbl_single_w32_seq::type_id::create("seq1");
    `uvm_do_with(seq1, {seq1.seq_addr == `APB_TEST_SLAVE_DATA0_OFFSET; seq1.seq_data == 32'd0;})
    #200ns;
    `uvm_do_with(seq1, {seq1.seq_addr == `APB_TEST_SLAVE_DATA1_OFFSET; seq1.seq_data == 32'd0;})
    #200ns;
    `uvm_do_with(seq1, {seq1.seq_addr == `APB_TEST_SLAVE_DATA2_OFFSET; seq1.seq_data == 32'd0;})
    #200ns;
    `uvm_do_with(seq1, {seq1.seq_addr == `APB_TEST_SLAVE_DATA3_OFFSET; seq1.seq_data == 32'd0;})
    #200ns;
endtask: body