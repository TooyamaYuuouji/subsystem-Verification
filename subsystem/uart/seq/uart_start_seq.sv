
class uart_start_seq extends apb3_master_base_seq;

    `uvm_object_utils(uart_start_seq)

    extern function new(string name="uart_start_seq");
    extern task body();

endclass: uart_start_seq

/**************************************************
* implement
**************************************************/
function uart_start_seq::new(string name="uart_start_seq");
    super.new(name);
endfunction: new

task uart_start_seq::body();
    super.body();

    // set interrrupt and enable tx
    `uvm_do_with(req, {
        addr == 10'h008;
        wen == 1;
        wdata == 8'b0001_0101;
    })
endtask: body