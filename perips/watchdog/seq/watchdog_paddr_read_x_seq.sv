
class watchdog_paddr_read_x_seq extends apb3_master_base_seq;

    `uvm_object_utils(watchdog_paddr_read_x_seq)

    extern function new(string name="watchdog_paddr_read_x_seq");
    extern task body();

endclass: watchdog_paddr_read_x_seq

/**************************************************
* implement
**************************************************/
function watchdog_paddr_read_x_seq::new(string name="watchdog_paddr_read_x_seq");
    super.new(name);
endfunction: new

task watchdog_paddr_read_x_seq::body();
    super.body();

    `uvm_do_with(req, {
        addr == 10'hxxx;
        wen == 0;
    })
endtask: body