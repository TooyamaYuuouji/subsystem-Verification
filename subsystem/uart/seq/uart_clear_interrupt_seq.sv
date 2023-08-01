
class uart_clear_interrupt_seq extends apb3_master_base_seq;

    `uvm_object_utils(uart_clear_interrupt_seq)

    extern function new(string name="uart_clear_interrupt_seq");
    extern task body();

endclass: uart_clear_interrupt_seq

/**************************************************
* implement
**************************************************/
function uart_clear_interrupt_seq::new(string name="uart_clear_interrupt_seq");
    super.new(name);
endfunction: new

task uart_clear_interrupt_seq::body();
    super.body();

    `uvm_do_with(req, {
        addr == 10'h00C;
        wen == 1;
        wdata == 4'b0011;
    })
endtask: body