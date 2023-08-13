
class timer0_test extends base_test;

    `uvm_component_utils(timer0_test)

    extern function new(string name="timer0_test", uvm_component parent=null);
    extern function void build_phase(uvm_phase phase);
    extern task main_phase(uvm_phase phase);
    extern function void final_phase(uvm_phase phase);

endclass: timer0_test

/**************************************************
* implement
**************************************************/
function timer0_test::new(string name="timer0_test", uvm_component parent=null);
    super.new(name, parent);
endfunction: new

function void timer0_test::build_phase(uvm_phase phase);
    super.build_phase(phase);

    ahbl_agt_cfg.is_active = 1;
    uvm_config_db #(ahbl_agent_configuration)::set(this, "env.ahbl_mst_agt", "cfg", ahbl_agt_cfg);
endfunction: build_phase

task timer0_test::main_phase(uvm_phase phase);
    timer0_internal_clock_seq seq_in;
    timer0_external_clock_seq seq_ex;
    timer0_external_enable_seq seq_exen;

    seq_in = timer0_internal_clock_seq::type_id::create("seq_in");
    seq_ex = timer0_external_clock_seq::type_id::create("seq_ex");
    seq_exen = timer0_external_enable_seq::type_id::create("seq_exen");
    phase.raise_objection(this);
    seq_in.start(virt_sqr);
    #500ns;
    seq_ex.start(virt_sqr);
    #500ns;
    seq_exen.start(virt_sqr);
    phase.drop_objection(this);
endtask: main_phase

function void timer0_test::final_phase(uvm_phase phase);
    super.final_phase(phase);
endfunction: final_phase