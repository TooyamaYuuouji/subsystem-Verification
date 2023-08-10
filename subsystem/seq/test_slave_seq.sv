
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
    `uvm_do_with(ahbl_tr, {
        hsel == 1'b1;
        hwrite == 1'b1;
        addr == 16'hB000;
        wdata == 32'd0;
        htrans == NONSEQUENTIAL;
        hsize == TRANS_SIZE_32BIT;
        hburst == SINGLE;
    })
    #200ns;
    `uvm_do_with(ahbl_tr, {
        hsel == 1'b1;
        hwrite == 1'b1;
        addr == 16'hB000 + 16'h0004;
        wdata == 32'd0;
        htrans == NONSEQUENTIAL;
        hsize == TRANS_SIZE_32BIT;
        hburst == SINGLE;
    })
    #200ns;
    `uvm_do_with(ahbl_tr, {
        hsel == 1'b1;
        hwrite == 1'b1;
        addr == 16'hB000 + 16'h0008;
        wdata == 32'd0;
        htrans == NONSEQUENTIAL;
        hsize == TRANS_SIZE_32BIT;
        hburst == SINGLE;
    })
    #200ns;
    `uvm_do_with(ahbl_tr, {
        hsel == 1'b1;
        hwrite == 1'b1;
        addr == 16'hB000 + 16'h000C;
        wdata == 32'd0;
        htrans == NONSEQUENTIAL;
        hsize == TRANS_SIZE_32BIT;
        hburst == SINGLE;
    })
endtask: body