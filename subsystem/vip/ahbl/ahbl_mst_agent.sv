`ifndef AHBL_MST_AGENT_SV
`define AHBL_MST_AGENT_SV


class ahbl_mst_agent extends uvm_agent;

	ahbl_agent_configuration 	cfg;
	virtual ahbl_interface		vif;
	ahbl_mst_driver						driver;
	ahbl_mst_monitor					monitor;
	ahbl_mst_sequencer				sequencer;

	uvm_analysis_port #(ahbl_transaction) ap;

	`uvm_component_utils(ahbl_mst_agent)

	function new(string name = "ahbl_mst_agent", uvm_component parent = null);
		super.new(name, parent);
	endfunction : new

	function void build_phase(uvm_phase phase);
		super.build_phase(phase);

		// ap = new("ap", this);

		if(!uvm_config_db #(ahbl_agent_configuration)::get(this, "", "cfg", cfg))
			`uvm_fatal("GETCFG", "cannot get cfg from config DB")

		if(!uvm_config_db #(virtual ahbl_interface)::get(this, "", "vif", vif))
			`uvm_fatal("GETCFG", "cannot get vif from config DB")

		if(cfg.is_active) begin
			driver 		= ahbl_mst_driver::type_id::create("driver", this);
			sequencer = ahbl_mst_sequencer::type_id::create("sequencer", this);
			uvm_config_db #(virtual ahbl_interface)::set(this, "driver", "vif", vif);
		end

		monitor = ahbl_mst_monitor::type_id::create("monitor", this);
		uvm_config_db #(virtual ahbl_interface)::set(this, "monitor", "vif", vif);
	endfunction : build_phase

	function void connect_phase(uvm_phase phase);
		super.connect_phase(phase);
	
		if(cfg.is_active) begin
			driver.seq_item_port.connect(sequencer.seq_item_export);
		end

		ap = monitor.ap;
	endfunction : connect_phase

endclass : ahbl_mst_agent


`endif // AHBL_MST_AGENT_SV
