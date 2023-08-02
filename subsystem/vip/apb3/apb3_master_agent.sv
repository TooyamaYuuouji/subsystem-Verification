
class apb3_master_agent extends uvm_agent;

    apb3_configuration config;
    apb3_master_driver driver;
    apb3_master_monitor monitor;
    apb3_master_sequencer sequencer;
    uvm_analysis_port #(apb3_transaction) mon_ap;

    `uvm_component_utils(apb3_master_agent)

    extern function new(string name="apb3_master_agent", uvm_component parent=null);
    extern function void build_phase(uvm_phase phase);
    extern function void connect_phase(uvm_phase phase);
    extern task main_phase(uvm_phase phase);

endclass: apb3_master_agent

/**************************************************
* implement
**************************************************/
function apb3_master_agent::new(string name="apb3_master_agent", uvm_component parent=null);
    super.new(name, parent);
endfunction: new

function void apb3_master_agent::build_phase(uvm_phase phase);
    super.build_phase(phase);

    driver = apb3_master_driver::type_id::create("driver", this);
    driver.vif = config.apb3_vif;
    monitor = apb3_master_monitor::type_id::create("monitor", this);
    monitor.vif = config.apb3_vif;
    sequencer = apb3_master_sequencer::type_id::create("sequencer", this);
endfunction: build_phase

function void apb3_master_agent::connect_phase(uvm_phase phase);
    super.connect_phase(phase);

    driver.seq_item_port.connect(sequencer.seq_item_export);
    mon_ap = monitor.ap;
endfunction: connect_phase

task apb3_master_agent::main_phase(uvm_phase phase);

endtask: main_phase