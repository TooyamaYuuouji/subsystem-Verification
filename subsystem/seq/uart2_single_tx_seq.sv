

class uart2_single_tx_seq extends base_seq;

    `uvm_object_utils(uart2_single_tx_seq)
    `uvm_declare_p_sequencer(virtual_sequencer)

    extern function new(string name="uart2_single_tx_seq");
    extern virtual task body();

endclass: uart2_single_tx_seq

/**************************************************
* implement
**************************************************/
function uart2_single_tx_seq::new(string name="uart2_single_tx_seq");
    super.new(name);
endfunction: new

task uart2_single_tx_seq::body();
    ahbl_single_w32_seq seq1;

    seq1 = ahbl_single_w32_seq::type_id::create("seq1");
    // set baud
    `uvm_do_with(seq1, {seq1.seq_addr == `UART2_BAUDDIV_OFFSET; seq1.seq_data == 32'd100;})
    // set mode
    `uvm_do_with(seq1, {seq1.seq_addr == `UART2_CTRL_OFFSET; seq1.seq_data == 8'b0001_0101;})
    // load tx value
    `uvm_do_with(seq1, {seq1.seq_addr == `UART2_DATA_OFFSET; seq1.seq_data == 8'b0111_0100;})
    // wait and clear interrupt
    wait(p_sequencer.sys_vif.apbsubsys_interrupt[`UART2_TX_INT_IRQ] == 1);
    `uvm_do_with(seq1, {seq1.seq_addr == `UART2_INTCLEAR_OFFSET; seq1.seq_data == 4'b0001;})
    #25us;
    // disable tx
    `uvm_do_with(seq1, {seq1.seq_addr == `UART2_CTRL_OFFSET; seq1.seq_data == 8'b0000_0000;})
endtask: body