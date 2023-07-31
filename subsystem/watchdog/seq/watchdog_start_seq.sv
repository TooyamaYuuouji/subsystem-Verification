
class watchdog_start_seq extends apb3_master_base_seq;

    rand logic[31:0] count_num;

    `uvm_object_utils(watchdog_start_seq)

    extern function new(string name="watchdog_start_seq");
    extern task body();

endclass: watchdog_start_seq

/**************************************************
* implement
**************************************************/
function watchdog_start_seq::new(string name="watchdog_start_seq");
    super.new(name);
endfunction: new

task watchdog_start_seq::body();
    super.body();

    // set watchdog
    `uvm_do_with(req, {
        addr == 10'h008;
        wen == 1;
        wdata == 2'b11;
    })
    // load data
    `uvm_do_with(req, {
        addr == 10'h000;
        wen == 1;
        wdata == 32'h0000_0014;
    })
endtask: body