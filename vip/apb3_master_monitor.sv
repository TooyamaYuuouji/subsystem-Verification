
class apb3_master_monitor extends uvm_monitor;

    virtual apb3_interface vif = null;

    `uvm_component_utils(apb3_master_monitor)

    function new(string name="apb3_master_monitor", uvm_component parent=null);
        super.new(name, parent);
    endfunction: new

    function void build_phase(uvm_phase phase);
        super.build_phase(phase);

        if(!uvm_config_db #(virtual apb3_interface)::get(this, "", "vif", vif)) begin
            `uvm_fatal("CFGERR", "cannot get virtual apb3_interface from db!")
        end
    endfunction: build_phase
    
    function void connect_phase(uvm_phase phase);
        super.connect_phase(phase);

        // if(vif == null) begin
        //     `uvm_fatal("NULVIF", "virtual interface cannot be null!")
        // end
    endfunction: connect_phase
endclass: apb3_master_monitor