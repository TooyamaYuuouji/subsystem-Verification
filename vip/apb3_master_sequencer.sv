
class apb3_master_sequencer extends uvm_sequencer #(apb3_transaction);

    `uvm_component_utils(apb3_master_sequencer)

    function new(string name="apb3_master_sequencer", uvm_component parent=null);
        super.new(name, parent);
    endfunction: new
    
endclass: apb3_master_sequencer