
class timer_test extends perips_base_test;

    apb3_configuration apb3_cfg;

    `uvm_component_utils(timer_test)

    extern function new(string name="timer_test", uvm_component parent=null);
    extern function void build_phase(uvm_phase phase);
    extern function void connect_phase(uvm_phase phase);
    extern task main_phase(uvm_phase phase);

endclass: timer_test

/**************************************************
* implement
**************************************************/
function timer_test::new(string name="timer_test", uvm_component parent=null);
    super.new(name, parent);
endfunction: new

function void timer_test::build_phase(uvm_phase phase);
    super.build_phase(phase);

    apb3_cfg = apb3_configuration::type_id::create("apb3_cfg", this);
    apb3_cfg.apb3_vif = apb3_vif;
    uvm_config_db #(apb3_configuration)::set(this, "env.agent", "config", apb3_cfg);
endfunction: build_phase

function void timer_test::connect_phase(uvm_phase phase);
    super.connect_phase(phase);

endfunction: connect_phase

task timer_test::main_phase(uvm_phase phase);
    virtual_seq v_seq;

    v_seq = virtual_seq::type_id::create("v_seq");
    v_seq.starting_phase = phase;
    v_seq.start(env.vsqr);
endtask: main_phase