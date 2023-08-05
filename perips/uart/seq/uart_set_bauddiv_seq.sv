
class uart_bauddiv_seq extends apb3_master_base_seq;

    `uvm_object_utils(uart_bauddiv_seq)

    extern function new(string name="uart_bauddiv_seq");
    extern task body();

endclass: uart_bauddiv_seq

/**************************************************
* implement
**************************************************/
function uart_bauddiv_seq::new(string name="uart_bauddiv_seq");
    super.new(name);
endfunction: new

task uart_bauddiv_seq::body();
    super.body();

    // 115200baud - 4340
    `uvm_do_with(req, {
        addr == 10'h010;
        wen == 1;
        wdata == 32'd100;
    })
endtask: body