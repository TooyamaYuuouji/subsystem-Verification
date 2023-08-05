`ifndef AHBL_AGENT_CONFIGURATION_SV
`define AHBL_AGENT_CONFIGURATION_SV


class ahbl_agent_configuration extends uvm_object;

	bit is_active = 1;

	`uvm_object_utils_begin(ahbl_agent_configuration)
	`uvm_object_utils_end

	function new(string name = "ahbl_agent_configuration");
		super.new(name);
	endfunction : new

endclass : ahbl_agent_configuration


`endif // AHBL_AGENT_CONFIGURATION_SV
