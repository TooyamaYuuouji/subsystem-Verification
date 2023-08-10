
class timer0_seq extends base_seq;

    `uvm_object_utils(timer0_seq)

    extern function new(string name="timer0_seq");
    extern virtual task body();

endclass: timer0_seq

/**************************************************
* implement
**************************************************/
function timer0_seq::new(string name="timer0_seq");
    super.new(name);
endfunction: new

task timer0_seq::body();
    // set value
    `uvm_do_with(ahbl_tr, {
        hsel == 1'b1;
        hwrite == 1'b1;
        addr == 16'h0000 + 16'h0008;
        wdata == 32'd14;
        htrans == NONSEQUENTIAL;
        hsize == TRANS_SIZE_16BIT;
        hburst == SINGLE;
    })
    // start
    #200ns;
    `uvm_do_with(ahbl_tr, {
        hsel == 1'b1;
        hwrite == 1'b1;
        addr == 16'h0000 + 16'h0000;
        wdata == 8'b0000_1001;
        htrans == NONSEQUENTIAL;
        hsize == TRANS_SIZE_8BIT;
        hburst == SINGLE;
    })
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
endtask: body