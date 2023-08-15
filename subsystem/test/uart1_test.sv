
class uart1_test extends base_test;

    `uvm_component_utils(uart1_test)

    extern function new(string name="uart1_test", uvm_component parent=null);
    extern function void build_phase(uvm_phase phase);
    extern task main_phase(uvm_phase phase);
    extern function void final_phase(uvm_phase phase);

endclass: uart1_test

/**************************************************
* implement
**************************************************/
function uart1_test::new(string name="uart1_test", uvm_component parent=null);
    super.new(name, parent);
endfunction: new

function void uart1_test::build_phase(uvm_phase phase);
    super.build_phase(phase);

    ahbl_agt_cfg.is_active = 1;
    uvm_config_db #(ahbl_agent_configuration)::set(this, "env.ahbl_mst_agt", "cfg", ahbl_agt_cfg);
endfunction: build_phase

task uart1_test::main_phase(uvm_phase phase);
    // uart1_single_tx_seq uart1_stx_seq;
    // uart1_continue_tx_seq uart1_contx_seq;

    // uart1_stx_seq = uart1_single_tx_seq::type_id::create("uart1_stx_seq");
    // uart1_contx_seq = uart1_continue_tx_seq::type_id::create("uart1_contx_seq");
    // phase.raise_objection(this);

    // uart1_stx_seq.start(virt_sqr);
    // uart1_contx_seq.start(virt_sqr);

    // #1us;

    // phase.drop_objection(this);

    uart1_single_rx_seq uart1_srx_seq;
    uart1_continue_rx_seq uart1_conrx_seq;

    uart1_srx_seq = uart1_single_rx_seq::type_id::create("uart1_srx_seq");
    uart1_conrx_seq = uart1_continue_rx_seq::type_id::create("uart1_conrx_seq");
    phase.raise_objection(this);

    uart1_srx_seq.start(virt_sqr);
    uart1_conrx_seq.start(virt_sqr);

    #1us;

    phase.drop_objection(this);
endtask: main_phase

function void uart1_test::final_phase(uvm_phase phase);
    super.final_phase(phase);
endfunction: final_phase