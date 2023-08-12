
class base_env extends uvm_env;

    `uvm_component_utils(base_env)

    ahbl_mst_agent ahbl_mst_agt;
    // virtual_sequencer virt_sqr;

    extern function new(string name="base_env", uvm_component parent=null);
    extern function void build_phase(uvm_phase phase);
    extern function void final_phase(uvm_phase phase);
    extern function void connect_phase(uvm_phase phase);

endclass: base_env

/**************************************************
* implement
**************************************************/
function base_env::new(string name="base_env", uvm_component parent=null);
    super.new(name, parent);

    ahbl_mst_agt = ahbl_mst_agent::type_id::create("ahbl_mst_agt", this);
    // virt_sqr = virtual_sequencer::type_id::create("virt_sqr", this);
endfunction: new

function void base_env::build_phase(uvm_phase phase);
    super.build_phase(phase);

    // virt_sqr.ahbl_mst_sqr = ahbl_mst_agt.sequencer;
endfunction: build_phase

function void base_env::connect_phase(uvm_phase phase);
    super.connect_phase(phase);

    // virt_sqr.ahbl_mst_sqr = env.ahbl_mst_agt.sequencer;
endfunction: connect_phase

function void base_env::final_phase(uvm_phase phase);
    super.final_phase(phase);

    // `uvm_info("DEBUG", "Now in base_env final_phase", UVM_LOW)
endfunction: final_phase