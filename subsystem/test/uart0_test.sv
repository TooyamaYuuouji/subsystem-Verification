
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
    uart0_seq seq;

    seq = uart0_seq::type_id::create("seq");
    phase.raise_objection(this);

    seq.start(virt_sqr);
    sys_vif.report_int();

    #100ns;

    phase.drop_objection(this);
endtask: main_phase

function void uart0_test::final_phase(uvm_phase phase);
    super.final_phase(phase);
endfunction: final_phase