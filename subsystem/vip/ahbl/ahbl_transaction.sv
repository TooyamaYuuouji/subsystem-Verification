`ifndef AHBL_TRANSACTION_SV
`define AHBL_TRANSACTION_SV


class ahbl_transaction extends uvm_sequence_item;

	rand logic[(`AHBL_MAX_ADDR_WIDTH) - 1 : 0] 	addr;
	rand logic[(`AHBL_MAX_DATA_WIDTH) - 1 : 0] 	wdata;
	rand logic[(`AHBL_MAX_DATA_WIDTH) - 1 : 0] 	rdata;
	rand logic																	hsel;
	rand logic																	hwrite;
	rand logic[3:0]															hprot;
	rand logic																	hresp = 1'b0;
	rand logic																	hreadyout = 1'b1;
	rand trans_type_enum												htrans = NONSEQUENTIAL;
	rand trans_size_enum												hsize = TRANS_SIZE_8BIT;
	rand burst_type_enum												hburst = SINGLE;

	protected rand int unsigned 													burst_beats			;
	protected rand logic [(`AHBL_MAX_ADDR_WIDTH) - 1 : 0] addr_q[$]				;
	protected int unsigned 																addr_idx 		= 0	;
	protected rand logic [(`AHBL_MAX_DATA_WIDTH) - 1 : 0] wdata_q[$]			;
	protected int unsigned 																wdata_idx 	= 0	;
	protected rand logic [(`AHBL_MAX_DATA_WIDTH) - 1 : 0] rdata_q[$]			;
	protected int unsigned 																rdata_idx 	= 0	;
	protected rand trans_type_enum												htrans_q[$]			;
	protected int unsigned 																htrans_idx 	= 0	;

	`uvm_object_utils_begin(ahbl_transaction)
		`uvm_field_int				(addr, 											UVM_ALL_ON)
		`uvm_field_int				(wdata, 										UVM_ALL_ON)
		`uvm_field_int				(rdata, 										UVM_ALL_ON)
		`uvm_field_int				(hwrite,										UVM_ALL_ON)
		`uvm_field_enum				(trans_type_enum, htrans, 	UVM_ALL_ON)
		`uvm_field_enum				(trans_size_enum, hsize, 		UVM_ALL_ON)
		`uvm_field_enum				(burst_type_enum, hburst, 	UVM_ALL_ON)

		`uvm_field_int				(burst_beats, 							UVM_ALL_ON)
		`uvm_field_queue_int	(addr_q,										UVM_ALL_ON)
		`uvm_field_int				(addr_idx,									UVM_ALL_ON)
		`uvm_field_queue_int	(wdata_q,										UVM_ALL_ON)
		`uvm_field_int				(wdata_idx,									UVM_ALL_ON)
		`uvm_field_queue_int	(rdata_q, 									UVM_ALL_ON)
		`uvm_field_int				(rdata_idx,									UVM_ALL_ON)
		`uvm_field_queue_enum	(trans_type_enum, htrans_q, UVM_ALL_ON)
		`uvm_field_int				(htrans_idx,								UVM_ALL_ON)
	`uvm_object_utils_end

	constraint hsizes_cstr {
		soft hsize == TRANS_SIZE_8BIT;
	}

	constraint htrans_cstr {
		(htrans == IDLE) -> (hburst == SINGLE);
		solve htrans before hburst;
	}

	constraint addr_cstr {
		(hsize == TRANS_SIZE_8BIT) 	-> (addr[  0] == 1'b0);
		(hsize == TRANS_SIZE_16BIT)	-> (addr[1:0] == 2'b00);
		solve hsize before addr;
	}

	constraint hburst_cstr {
		(hburst == SINGLE) -> (burst_beats == 1);
		(hburst == WRAP4 ) -> (burst_beats == 4);
		(hburst == WRAP8 ) -> (burst_beats == 8);
		(hburst == WRAP16) -> (burst_beats == 16);
		(hburst == INCR4 ) -> (burst_beats == 4);
		(hburst == INCR8 ) -> (burst_beats == 8);
		(hburst == INCR16) -> (burst_beats == 16);
		solve hburst before burst_beats;
	}

	constraint queue_cstr {
		addr_q.size() 	== burst_beats;
		wdata_q.size()	== burst_beats;
		rdata_q.size()	== burst_beats;
		htrans_q.size()	== burst_beats;
		solve burst_beats before addr_q;
		solve burst_beats before wdata_q;
		solve burst_beats before rdata_q;
		solve burst_beats before htrans_q;
	}

	function new(string name = "ahbl_transaction");
		super.new(name);
	endfunction : new

	function void post_randomize();
		int i;

		addr_q[0] = addr;
		wdata_q[0] = wdata;
		rdata_q[0] = rdata;
		htrans_q[0] = NONSEQUENTIAL;
		for(i = 1; i < burst_beats; i ++) begin
			addr_q[i] = addr_q[i-1] + (2**hsize);
			htrans_q[i] = SEQUENTIAL;
		end
	endfunction : post_randomize

	virtual function logic [(`AHBL_MAX_ADDR_WIDTH)-1:0] next_addr();
		addr_idx ++;

		return addr_q[addr_idx-1];
	endfunction : next_addr

	virtual function logic [(`AHBL_MAX_DATA_WIDTH)-1:0] next_wdata();
		wdata_idx ++;

		return wdata_q[wdata_idx-1];
	endfunction : next_wdata

	virtual function logic [(`AHBL_MAX_DATA_WIDTH)-1:0] next_rdata();
		rdata_idx ++;

		return rdata_q[rdata_idx-1];
	endfunction : next_rdata

	virtual function trans_type_enum next_htrans();
		htrans_idx ++;

		return htrans_q[htrans_idx-1];
	endfunction : next_htrans

	virtual function trans_type_enum current_htrans();
		return htrans_q[htrans_idx];
	endfunction : current_htrans

	virtual function bit is_last_beat();
		return (htrans_idx == htrans_q.size());
	endfunction : is_last_beat

	virtual function int get_burst_beats();
		return burst_beats;
	endfunction : get_burst_beats

endclass : ahbl_transaction


`endif // AHBL_TRANSACTION_SV
