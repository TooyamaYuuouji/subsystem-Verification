
class apb3_master_agent extends uvm_agent;

    // virtual apb3_interface vif = null;
    apb3_master_driver driver;
    apb3_master_monitor monitor;
    apb3_master_sequencer sequencer;

    `uvm_component_utils(apb3_master_agent)

    function new(string name="apb3_master_agent", uvm_component parent=null);
        super.new(name, parent);
    endfunction: new

    function void build_phase(uvm_phase phase);
        super.build_phase(phase);

        driver = apb3_master_driver::type_id::create("driver", this);
        monitor = apb3_master_monitor::type_id::create("monitor", this);
        sequencer = apb3_master_sequencer::type_id::create("sequencer", this);
    endfunction: build_phase

    function void connect_phase(uvm_phase phase);
        super.connect_phase(phase);

        // if(vif == null) begin
        //     `uvm_fatal("NULVIF", "virtual interface cannot be null!")
        // end
        // driver.vif = vif;
        // monitor.vif = vif;
        driver.seq_item_port.connect(sequencer.seq_item_export);
    endfunction: connect_phase

    task main_phase(uvm_phase phase);

    endtask: main_phase

endclass: apb3_master_agent