
class uart_set_tx_data_seq extends apb3_master_base_seq;

    rand bit[7:0] tx_data;

    `uvm_object_utils(uart_set_tx_data_seq)

    extern function new(string name="uart_set_tx_data_seq");
    extern task body();

endclass: uart_set_tx_data_seq

/**************************************************
* implement
**************************************************/
function uart_set_tx_data_seq::new(string name="uart_set_tx_data_seq");
    super.new(name);
endfunction: new

task uart_set_tx_data_seq::body();
    super.body();

    // 115200baud - 4340
    `uvm_do_with(req, {
        addr == 10'h000;
        wen == 1;
        wdata == tx_data;
    })
    `uvm_info("DEBUG", $sformatf("uart tx data:%b", tx_data), UVM_LOW)
endtask: body