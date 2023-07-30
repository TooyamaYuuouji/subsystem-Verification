
class timer_clear_interrupt_seq extends apb3_master_base_seq;

    `uvm_object_utils(timer_clear_interrupt_seq)

    extern function new(string name="timer_clear_interrupt_seq");
    extern task body();

endclass: timer_clear_interrupt_seq

/**************************************************
* implement
**************************************************/
function timer_clear_interrupt_seq::new(string name="timer_clear_interrupt_seq");
    super.new(name);
endfunction: new

task timer_clear_interrupt_seq::body();
    super.body();

    `uvm_do_with(req, {
        addr == 10'h00C;
        wen == 1;
        wdata == 32'h0000_0001;
    })
endtask: body