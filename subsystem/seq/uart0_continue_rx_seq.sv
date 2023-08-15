

class uart0_continue_rx_seq extends base_seq;

    `uvm_object_utils(uart0_continue_rx_seq)
    `uvm_declare_p_sequencer(virtual_sequencer)

    extern function new(string name="uart0_continue_rx_seq");
    extern virtual task body();

endclass: uart0_continue_rx_seq

/**************************************************
* implement
**************************************************/
function uart0_continue_rx_seq::new(string name="uart0_continue_rx_seq");
    super.new(name);
endfunction: new

task uart0_continue_rx_seq::body();
    ahbl_single_w32_seq wseq;
    ahbl_single_r32_seq rseq;
    logic[7:0] tx_value;

    wseq = ahbl_single_w32_seq::type_id::create("wseq");
    rseq = ahbl_single_r32_seq::type_id::create("rseq");
    // set baud
    `uvm_do_with(wseq, {wseq.seq_addr == `UART0_BAUDDIV_OFFSET; wseq.seq_data == 32'd100;})
    // set mode
    `uvm_do_with(wseq, {wseq.seq_addr == `UART0_CTRL_OFFSET; wseq.seq_data == 8'b0010_1010;})
    // receive rx
    p_sequencer.sys_vif.simulate_rx(100);
    // wait and clear interrupt
    wait(p_sequencer.sys_vif.apbsubsys_interrupt[`UART0_RX_INT_IRQ] == 1);
    `uvm_do_with(wseq, {wseq.seq_addr == `UART0_INTCLEAR_OFFSET; wseq.seq_data == 4'b0010;})
    // send another rx
    p_sequencer.sys_vif.simulate_rx(100);
    // wait overrun interrupt
    wait(p_sequencer.sys_vif.apbsubsys_interrupt[`UART0_OVERFLOW_INT_IRQ] == 1);
    // read rx value
    `uvm_do_with(rseq, {rseq.seq_addr == `UART0_DATA_OFFSET;})
    // read rx cannot clear overrun interrupt, need manual operation
    `uvm_do_with(wseq, {wseq.seq_addr == `UART0_INTCLEAR_OFFSET; wseq.seq_data == 4'b1010;})
    // read rx value
    `uvm_do_with(rseq, {rseq.seq_addr == `UART0_DATA_OFFSET;})
endtask: body