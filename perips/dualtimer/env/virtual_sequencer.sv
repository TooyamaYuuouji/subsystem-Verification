
class virtual_sequencer extends uvm_sequencer;

    apb3_master_sequencer apb3_mst_sqr;

    `uvm_component_utils(virtual_sequencer)

    function new(string name="virtual_sequencer", uvm_component parent=null);
        super.new(name, parent);
    endfunction: new

endclass: virtual_sequencer