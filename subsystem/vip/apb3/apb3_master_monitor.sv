
class apb3_master_monitor extends uvm_monitor;

    virtual apb3_interface vif = null;

    `uvm_component_utils(apb3_master_monitor)

    function new(string name="apb3_master_monitor", uvm_component parent=null);
        super.new(name, parent);
    endfunction: new

    function void build_phase(uvm_phase phase);
        super.build_phase(phase);

    endfunction: build_phase
    
    function void connect_phase(uvm_phase phase);
        super.connect_phase(phase);

    endfunction: connect_phase
endclass: apb3_master_monitor