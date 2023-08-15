

class uart0_single_tx_seq extends base_seq;

    `uvm_object_utils(uart0_single_tx_seq)
    `uvm_declare_p_sequencer(virtual_sequencer)

    extern function new(string name="uart0_single_tx_seq");
    extern virtual task body();

endclass: uart0_single_tx_seq

/**************************************************
* implement
**************************************************/
function uart0_single_tx_seq::new(string name="uart0_single_tx_seq");
    super.new(name);
endfunction: new

task uart0_single_tx_seq::body();
    ahbl_single_w32_seq seq1;

    seq1 = ahbl_single_w32_seq::type_id::create("seq1");
    // set baud
    `uvm_do_with(seq1, {seq1.seq_addr == `UART0_BAUDDIV_OFFSET; seq1.seq_data == 32'd100;})
    // set mode
    `uvm_do_with(seq1, {seq1.seq_addr == `UART0_CTRL_OFFSET; seq1.seq_data == 8'b0001_0101;})
    // load tx value
    `uvm_do_with(seq1, {seq1.seq_addr == `UART0_DATA_OFFSET; seq1.seq_data == 8'b0111_0100;})
    // wait and clear interrupt
    wait(p_sequencer.sys_vif.apbsubsys_interrupt[`UART0_TX_INT_IRQ] == 1);
    `uvm_do_with(seq1, {seq1.seq_addr == `UART0_INTCLEAR_OFFSET; seq1.seq_data == 4'b0001;})
    #25us;
    // disable tx
    `uvm_do_with(seq1, {seq1.seq_addr == `UART0_CTRL_OFFSET; seq1.seq_data == 8'b0000_0000;})
endtask: body