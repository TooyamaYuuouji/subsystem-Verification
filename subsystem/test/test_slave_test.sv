
class test_slave_test extends base_test;

    `uvm_component_utils(test_slave_test)

    extern function new(string name="test_slave_test", uvm_component parent=null);
    extern function void build_phase(uvm_phase phase);
    extern task main_phase(uvm_phase phase);
    extern function void final_phase(uvm_phase phase);

endclass: test_slave_test

/**************************************************
* implement
**************************************************/
function test_slave_test::new(string name="test_slave_test", uvm_component parent=null);
    super.new(name, parent);
endfunction: new

function void test_slave_test::build_phase(uvm_phase phase);
    super.build_phase(phase);

    ahbl_agt_cfg.is_active = 1;
    uvm_config_db #(ahbl_agent_configuration)::set(this, "env.ahbl_mst_agt", "cfg", ahbl_agt_cfg);
endfunction: build_phase

task test_slave_test::main_phase(uvm_phase phase);
    test_slave_seq seq;

    seq = test_slave_seq::type_id::create("seq");
    phase.raise_objection(this);

    seq.start(env.ahbl_mst_agt.sequencer);
    #500ns;

    phase.drop_objection(this);
endtask: main_phase

function void test_slave_test::final_phase(uvm_phase phase);
    super.final_phase(phase);
endfunction: final_phase