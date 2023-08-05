`ifndef AHBL_MST_MONITOR_SV
`define AHBL_MST_MONITOR_SV


class ahbl_mst_monitor extends uvm_monitor;

	virtual ahbl_interface 								vif;
	ahbl_transaction 											tr;
	uvm_analysis_port	#(ahbl_transaction) ap;

	`uvm_component_utils(ahbl_mst_monitor)

	function new(string name = "ahbl_mst_monitor", uvm_component parent = null);
		super.new(name, parent);
	endfunction : new

	function void build_phase(uvm_phase phase);
		super.build_phase(phase);

		ap = new("ap", this);
		if(!uvm_config_db #(virtual ahbl_interface)::get(this, "", "vif", vif))
			`uvm_fatal("GETCFG", "cannot get vif from config DB")
	endfunction : build_phase

	function void connect_phase(uvm_phase phase);
		super.connect_phase(phase);
	endfunction : connect_phase

	task main_phase(uvm_phase phase);
		while(1) begin
			@(vif.cb_mon);
			if(!vif.cb_mon.HRESETn) begin
				tr = null;
			end
			else begin
				// check data phase first
				if((tr != null) && (vif.cb_mon.HREADYOUT)) begin
					samp_data_phase(tr);
					ap.write(tr);
					tr = null;
				end
				// nonsequential: 'b10 and sequential 'b11
				// when the htrans = 'b1x, can be seem a valid receive
				if(vif.cb_mon.HREADYOUT & vif.cb_mon.HTRANS[1]) begin
					//// data phase
					//if(tr != null) begin
					//	samp_data_phase(tr);
					//	ap.write(tr);
					//	`uvm_info(get_type_name(), "monitor ahbl transaction", UVM_LOW)
					//	tr = null;
					//end
					//// addr phase
					//else begin
					if(tr == null) begin
						samp_addr_phase(tr);
					end
				end
			end
		end
	endtask : main_phase

	task samp_data_phase(ref ahbl_transaction tr);
		tr.wdata = vif.cb_mon.HWDATA;
		tr.rdata = vif.cb_mon.HRDATA;
		tr.hresp = vif.cb_mon.HRESP;
	endtask : samp_data_phase

	task samp_addr_phase(ref ahbl_transaction tr);
		tr = ahbl_transaction::type_id::create("tr");

		tr.addr 	= vif.cb_mon.HADDR;
		tr.wdata 	= vif.cb_mon.HWDATA;
		tr.rdata 	= vif.cb_mon.HRDATA;
		tr.hsel   = vif.cb_mon.HSEL;
		tr.hwrite = vif.cb_mon.HWRITE;
		tr.hprot  = vif.cb_mon.HPROT;
		tr.htrans = trans_type_enum'(vif.cb_mon.HTRANS);
		tr.hsize 	= trans_size_enum'(vif.cb_mon.HSIZE);
		tr.hburst = burst_type_enum'(vif.cb_mon.HBURST);
	endtask : samp_addr_phase

endclass : ahbl_mst_monitor


`endif // AHBL_MST_MONITOR_SV
