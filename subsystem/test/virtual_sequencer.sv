
class virtual_sequencer extends uvm_sequencer;

    `uvm_component_utils(virtual_sequencer)

    ahbl_mst_sequencer ahbl_mst_sqr;
    int test_in_vsqr = 21;

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
endfunction: build_phase