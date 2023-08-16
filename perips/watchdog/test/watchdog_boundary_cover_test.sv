
class watchdog_test extends watchdog_base_test;

    apb3_configuration apb3_cfg;

    `uvm_component_utils(watchdog_test)

    extern function new(string name="watchdog_test", uvm_component parent=null);
    extern function void build_phase(uvm_phase phase);
    extern function void connect_phase(uvm_phase phase);
    extern task main_phase(uvm_phase phase);

endclass: watchdog_test

/**************************************************
* implement
**************************************************/
function watchdog_test::new(string name="watchdog_test", uvm_component parent=null);
    super.new(name, parent);
endfunction: new

function void watchdog_test::build_phase(uvm_phase phase);
    super.build_phase(phase);

    apb3_cfg = apb3_configuration::type_id::create("apb3_cfg", this);
    apb3_cfg.apb3_vif = apb3_vif;
    uvm_config_db #(apb3_configuration)::set(this, "env", "config", apb3_cfg);
endfunction: build_phase

function void watchdog_test::connect_phase(uvm_phase phase);
    super.connect_phase(phase);

    rm.default_map.set_auto_predict(1);
    rm.default_map.set_sequencer(env.vsqr.apb3_mst_sqr, adapter);
endfunction: connect_phase

task watchdog_test::main_phase(uvm_phase phase);
    watchdog_paddr_read_x_seq wd_paddr_rx_seq;

    wd_paddr_rx_seq = watchdog_paddr_read_x_seq::type_id::create("wd_paddr_rx_seq");

    phase.raise_objection(this);
    wd_paddr_rx_seq.start(env.vsqr.apb3_mst_sqr);
    #2us;
    phase.drop_objection(this);
endtask: main_phase