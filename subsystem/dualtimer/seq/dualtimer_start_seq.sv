
class dualtimer_start_seq extends apb3_master_base_seq;

    rand logic[31:0] count_num;

    `uvm_object_utils(dualtimer_start_seq)

    extern function new(string name="dualtimer_start_seq");
    extern task body();

endclass: dualtimer_start_seq

/**************************************************
* implement
**************************************************/
function dualtimer_start_seq::new(string name="dualtimer_start_seq");
    super.new(name);
endfunction: new

task dualtimer_start_seq::body();
    super.body();

    // load data
    `uvm_do_with(req, {
        addr == 10'h000;
        wen == 1;
        wdata == count_num;
        // wdata == 32'd0000_0014;
    })
    // enable timer
    `uvm_do_with(req, {
        addr == 10'h008;
        wen == 1;
        wdata == 8'b1010_0000;
    })
endtask: body