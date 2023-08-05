`ifndef AHBL_MST_DRIVER_SV
`define AHBL_MST_DRIVER_SV


class ahbl_mst_driver extends uvm_driver #(ahbl_transaction);

	virtual ahbl_interface 			vif;
	protected ahbl_transaction 	tr_addr_phase;
	protected ahbl_transaction 	tr_data_phase;

	`uvm_component_utils(ahbl_mst_driver)

	function new(string name = "ahbl_mst_driver", uvm_component parent = null);
		super.new(name, parent);
	endfunction : new

	function void build_phase(uvm_phase phase);
		super.build_phase(phase);

		if(!uvm_config_db #(virtual ahbl_interface)::get(this, "", "vif", vif))
			`uvm_fatal("GETCFG", "cannot get vif from config DB!")
	endfunction : build_phase

	function void connect_phase(uvm_phase phase);
		super.connect_phase(phase);
	endfunction : connect_phase

	task main_phase(uvm_phase phase);
		while(1) begin
			@(vif.cb_mon);
			if(!vif.cb_mst.HRESETn) begin
				vif.cb_mst.HSEL 			<= 1'b0;
				vif.cb_mst.HADDR 			<= 'd0;
				vif.cb_mst.HTRANS			<= IDLE;
				vif.cb_mst.HBURST			<= SINGLE;
				vif.cb_mst.HSIZE			<= TRANS_SIZE_8BIT;
				vif.cb_mst.HPROT			<= 'd0;
				vif.cb_mst.HMASTLOCK	<= 1'b0;
				vif.cb_mst.HWRITE			<= 1'b0;
				vif.cb_mst.HWDATA			<= 'd0;
				tr_addr_phase = null;
				tr_data_phase = null;
			end
			else begin
				if(tr_data_phase != null) begin
					drive_tr_data_phase(tr_data_phase);
					if(vif.cb_mst.HREADYOUT & (tr_data_phase.hburst == SINGLE | tr_data_phase.is_last_beat())) begin
						seq_item_port.item_done();
						tr_data_phase = null;
						tr_addr_phase = null;
						`uvm_info(get_type_name(), "drive data successfully", UVM_LOW)
					end
				end

				if(tr_addr_phase != null) begin
					drive_tr_addr_phase(tr_addr_phase);
				end
				else begin
					seq_item_port.try_next_item(tr_addr_phase);
					if(tr_addr_phase != null) begin
						drive_tr_addr_phase(tr_addr_phase);
						`uvm_info(get_type_name(), "driver addr successfully", UVM_LOW)
					end
					else begin
						drive_idle();
					end
				end
			end
		end
	endtask : main_phase

	task drive_tr_addr_phase(ref ahbl_transaction tr);
		if(vif.cb_mst.HREADYOUT) begin
			vif.cb_mst.HSEL				<= 1'b1;
			vif.cb_mst.HADDR			<= ((tr.current_htrans() != IDLE) & (tr.current_htrans() != BUSY)) ? tr.next_addr() : vif.HADDR;
			vif.cb_mst.HTRANS			<= tr.next_htrans();
			vif.cb_mst.HBURST			<= tr.hburst;
			vif.cb_mst.HSIZE			<= tr.hsize;
			vif.cb_mst.HPROT			<= 'd0;
			vif.cb_mst.HMASTLOCK	<= 'd0;
			vif.cb_mst.HWRITE			<= tr.hwrite;
			this.tr_data_phase 		<= this.tr_addr_phase;
		end
	endtask : drive_tr_addr_phase

	task drive_tr_data_phase(ref ahbl_transaction tr);
		if(vif.cb_mst.HREADYOUT)
			vif.cb_mst.HWDATA <= (tr.hwrite) ? tr.next_wdata() : 'd0;
	endtask : drive_tr_data_phase

	task drive_idle();
		vif.cb_mst.HSEL 			<= 1'b0;
		vif.cb_mst.HADDR 			<= 'd0;
		vif.cb_mst.HTRANS			<= IDLE;
		vif.cb_mst.HBURST			<= SINGLE;
		vif.cb_mst.HSIZE			<= TRANS_SIZE_8BIT;
		vif.cb_mst.HPROT			<= 'd0;
		vif.cb_mst.HMASTLOCK	<= 1'b0;
		vif.cb_mst.HWRITE			<= 1'b0;
	endtask : drive_idle

endclass : ahbl_mst_driver


`endif // AHBL_MST_DRIVER_SV
