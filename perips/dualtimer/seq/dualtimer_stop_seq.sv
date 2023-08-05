
class dualtimer_stop_seq extends apb3_master_base_seq;

    rand logic[31:0] count_num;

    `uvm_object_utils(dualtimer_stop_seq)

    extern function new(string name="dualtimer_stop_seq");
    extern task body();

endclass: dualtimer_stop_seq

/**************************************************
* implement
**************************************************/
function dualtimer_stop_seq::new(string name="dualtimer_stop_seq");
    super.new(name);
endfunction: new

task dualtimer_stop_seq::body();
    super.body();

    `uvm_do_with(req, {
        addr == 10'h008;
        wen == 1;
        wdata == 32'h0000_0020;
    })
endtask: body