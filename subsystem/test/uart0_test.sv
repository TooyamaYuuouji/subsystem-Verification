//------------------------------------------------------------------------------
// 对uart0进行测试

class uart0_test extends base_test;

    `uvm_component_utils(uart0_test)

    extern function new(string name="uart0_test", uvm_component parent=null);
    extern function void build_phase(uvm_phase phase);
    extern task main_phase(uvm_phase phase);
    extern function void final_phase(uvm_phase phase);

endclass: uart0_test

/**************************************************
* implement
**************************************************/
function uart0_test::new(string name="uart0_test", uvm_component parent=null);
    super.new(name, parent);
endfunction: new

function void uart0_test::build_phase(uvm_phase phase);
    super.build_phase(phase);

    ahbl_agt_cfg.is_active = 1;
    uvm_config_db #(ahbl_agent_configuration)::set(this, "env.ahbl_mst_agt", "cfg", ahbl_agt_cfg);
endfunction: build_phase

task uart0_test::main_phase(uvm_phase phase);
    uart0_single_tx_seq uart0_srx_seq;
    uart0_continue_tx_seq uart0_conrx_seq;

    uart0_srx_seq = uart0_single_tx_seq::type_id::create("uart0_srx_seq");
    uart0_conrx_seq = uart0_continue_tx_seq::type_id::create("uart0_conrx_seq");
    phase.raise_objection(this);

    uart0_srx_seq.start(virt_sqr);
    uart0_conrx_seq.start(virt_sqr);

    #1us;

    phase.drop_objection(this);
endtask: main_phase

function void uart0_test::final_phase(uvm_phase phase);
    super.final_phase(phase);
endfunction: final_phase