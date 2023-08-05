`ifndef AHBL_MST_SEQUENCER_SV
`define AHBL_MST_SEQUENCER_SV


class ahbl_mst_sequencer extends uvm_sequencer #(ahbl_transaction);

	`uvm_component_utils(ahbl_mst_sequencer)

	function new(string name = "ahbl_mst_sequencer", uvm_component parent = null);
		super.new(name, parent);
	endfunction : new

endclass : ahbl_mst_sequencer


`endif // AHBL_MST_SEQUENCER_SV
