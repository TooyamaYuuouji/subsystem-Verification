
class base_test extends uvm_test;

    `uvm_component_utils(base_test)

    virtual ahbl_interface ahbl_vif;
    virtual system_interface sys_vif;
    ahbl_agent_configuration ahbl_agt_cfg;
    base_env env;
    virtual_sequencer virt_sqr;

    extern function new(string name="base_test", uvm_component parent=null);
    extern function void build_phase(uvm_phase phase);
    extern function void connect_phase(uvm_phase phase);
    extern task main_phase(uvm_phase phase);
    extern function void final_phase(uvm_phase phase);

endclass: base_test

/**************************************************
* implement
**************************************************/
function base_test::new(string name="base_test", uvm_component parent=null);
    super.new(name, parent);
    
    ahbl_agt_cfg = ahbl_agent_configuration::type_id::create("ahbl_agt_cfg");
    env = base_env::type_id::create("env", this);
    virt_sqr = virtual_sequencer::type_id::create("virt_sqr", this);
endfunction: new

function void base_test::build_phase(uvm_phase phase);
    super.build_phase(phase);

    if(!uvm_config_db #(virtual ahbl_interface)::get(this, "", "ahbl_if", ahbl_vif)) begin
        `uvm_fatal("GETCFG", "cannot get ahbl_if from config DB")
    end
    if(!uvm_config_db #(virtual system_interface)::get(this, "", "sys_if", sys_vif)) begin
        `uvm_fatal("GETCFG", "cannot get sys_if from config DB")
    end
    uvm_config_db #(virtual ahbl_interface)::set(this, "env.ahbl_mst_agt", "vif", ahbl_vif);

    // virt_sqr.ahbl_mst_sqr = env.ahbl_mst_agt.sequencer;
endfunction: build_phase

function void base_test::connect_phase(uvm_phase phase);
    super.connect_phase(phase);

    virt_sqr.ahbl_mst_sqr = env.ahbl_mst_agt.sequencer;
endfunction: connect_phase

task base_test::main_phase(uvm_phase phase);

endtask: main_phase

function void base_test::final_phase(uvm_phase phase);
    super.final_phase(phase);

    uvm_top.print_topology();
endfunction: final_phase