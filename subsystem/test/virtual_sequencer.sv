
class virtual_sequencer extends uvm_sequencer;

    `uvm_component_utils(virtual_sequencer)

    ahbl_mst_sequencer ahbl_mst_sqr;
    virtual system_interface sys_vif;
    int test_for_timer0_seq = 500;

    extern function new(string name="virtual_sequencer", uvm_component parent=null);
    extern function void build_phase(uvm_phase phase);

endclass: virtual_sequencer

/**************************************************
* implement
**************************************************/
function virtual_sequencer::new(string name="virtual_sequencer", uvm_component parent=null);
    super.new(name, parent);
endfunction: new

function void virtual_sequencer::build_phase(uvm_phase phase);
    super.build_phase(phase);

    if(!uvm_config_db #(virtual system_interface)::get(this, "", "sys_vif", sys_vif)) begin
        `uvm_fatal("GETCFG", "cannot get sys_if from config DB")
    end
endfunction: build_phase