
class timer_stop_seq extends apb3_master_base_seq;

    `uvm_object_utils(timer_stop_seq)

    extern function new(string name="timer_stop_seq");
    extern task body();

endclass: timer_stop_seq

/**************************************************
* implement
**************************************************/
function timer_stop_seq::new(string name="timer_stop_seq");
    super.new(name);
endfunction: new

task timer_stop_seq::body();
    super.body();

    `uvm_do_with(req, {
        addr == 10'h000;
        wen == 1;
        wdata == 4'b1000;
    })
endtask: body