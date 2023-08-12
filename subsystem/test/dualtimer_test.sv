
class dualtimer_test extends base_test;

    `uvm_component_utils(dualtimer_test)

    extern function new(string name="dualtimer_test", uvm_component parent=null);
    extern function void build_phase(uvm_phase phase);
    extern task main_phase(uvm_phase phase);
    extern function void final_phase(uvm_phase phase);

endclass: dualtimer_test

/**************************************************
* implement
**************************************************/
function dualtimer_test::new(string name="dualtimer_test", uvm_component parent=null);
    super.new(name, parent);
endfunction: new

function void dualtimer_test::build_phase(uvm_phase phase);
    super.build_phase(phase);

    ahbl_agt_cfg.is_active = 1;
    uvm_config_db #(ahbl_agent_configuration)::set(this, "env.ahbl_mst_agt", "cfg", ahbl_agt_cfg);
endfunction: build_phase

task dualtimer_test::main_phase(uvm_phase phase);
    dualtimer_seq seq;

    seq = dualtimer_seq::type_id::create("seq");
    phase.raise_objection(this);

    seq.start(virt_sqr);
    #500ns;
    sys_vif.report_int();

    phase.drop_objection(this);
endtask: main_phase

function void dualtimer_test::final_phase(uvm_phase phase);
    super.final_phase(phase);
endfunction: final_phase