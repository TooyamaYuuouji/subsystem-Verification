`ifndef AHBL_INTERFACE_SV
`define AHBL_INTERFACE_SV


interface ahbl_interface(input bit HCLK, input bit HRESETn);

	`include "ahbl_defines.svh"
//	`include "ahbl_types.sv"

	logic [(`AHBL_MAX_ADDR_WIDTH - 1) : 0]	HADDR;
	logic	[2:0]															HBURST;
	logic																		HMASTLOCK;
	logic	[3:0]															HPROT;
	logic [2:0]															HSIZE;
	logic [1:0]															HTRANS;
	logic	[(`AHBL_MAX_DATA_WIDTH - 1) : 0]	HWDATA;
	logic																		HWRITE;
	logic [(`AHBL_MAX_DATA_WIDTH - 1) : 0] 	HRDATA;
	logic																		HREADYOUT;
	logic																		HRESP;
	logic																		HSEL;

	//extra interface signal


	// debug
//	trans_type_enum debug_trans_type;
//	trans_size_enum debug_trans_size;
//	burst_type_enum debug_burst_type;
//
//	assign debug_trans_type = trans_type_enum'(HTRANS);
//	assign debug_trans_size = trans_size_enum'(HSIZE);
//	assign debug_burst_type = burst_type_enum'(HBURST);

	clocking cb_mst @(posedge HCLK);
		default input #1ns output #1ns;

		input  HRESETn, HRDATA, HREADYOUT, HRESP;
		output HADDR, HBURST, HMASTLOCK, HPROT, HSIZE, HTRANS, HWDATA, HWRITE, HSEL;
	endclocking : cb_mst

	clocking cb_mon @(posedge HCLK);
		default input #1ns output #1ns;

		input  HRESETn, HRDATA, HREADYOUT, HRESP;
		input  HADDR, HBURST, HMASTLOCK, HPROT, HSIZE, HTRANS, HWDATA, HWRITE, HSEL;
	endclocking : cb_mon

endinterface : ahbl_interface


`endif // AHBL_INTERFACE_SV
