
class watchdog_clear_interrupt_seq extends apb3_master_base_seq;

    rand logic[31:0] count_num;

    `uvm_object_utils(watchdog_clear_interrupt_seq)

    extern function new(string name="watchdog_clear_interrupt_seq");
    extern task body();

endclass: watchdog_clear_interrupt_seq

/**************************************************
* implement
**************************************************/
function watchdog_clear_interrupt_seq::new(string name="watchdog_clear_interrupt_seq");
    super.new(name);
endfunction: new

task watchdog_clear_interrupt_seq::body();
    super.body();

    `uvm_do_with(req, {
        addr == 10'h00c;
        wen == 1;
        wdata == 32'h0000_0001;
    })
endtask: body