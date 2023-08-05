`ifndef RAL_RAL_UART
`define RAL_RAL_UART

import uvm_pkg::*;

class ral_reg_DATA extends uvm_reg;
	rand uvm_reg_field RTDATA;

	function new(string name = "DATA");
		super.new(name, 16,build_coverage(UVM_NO_COVERAGE));
	endfunction: new
   virtual function void build();
      this.RTDATA = uvm_reg_field::type_id::create("RTDATA",,get_full_name());
      this.RTDATA.configure(this, 8, 0, "RW", 0, 8'hxx, 1, 0, 1);
   endfunction: build

	`uvm_object_utils(ral_reg_DATA)

endclass : ral_reg_DATA


class ral_reg_STATE extends uvm_reg;
	rand uvm_reg_field RX_OVERRUN;
	rand uvm_reg_field TX_OVERRUN;
	rand uvm_reg_field RX_FULL;
	rand uvm_reg_field TX_FULL;

	function new(string name = "STATE");
		super.new(name, 8,build_coverage(UVM_NO_COVERAGE));
	endfunction: new
   virtual function void build();
      this.RX_OVERRUN = uvm_reg_field::type_id::create("RX_OVERRUN",,get_full_name());
      this.RX_OVERRUN.configure(this, 1, 3, "RW", 0, 1'b0, 1, 0, 0);
      this.TX_OVERRUN = uvm_reg_field::type_id::create("TX_OVERRUN",,get_full_name());
      this.TX_OVERRUN.configure(this, 1, 2, "RW", 0, 1'b0, 1, 0, 0);
      this.RX_FULL = uvm_reg_field::type_id::create("RX_FULL",,get_full_name());
      this.RX_FULL.configure(this, 1, 1, "RW", 0, 1'b0, 1, 0, 0);
      this.TX_FULL = uvm_reg_field::type_id::create("TX_FULL",,get_full_name());
      this.TX_FULL.configure(this, 1, 0, "RW", 0, 1'b0, 1, 0, 0);
   endfunction: build

	`uvm_object_utils(ral_reg_STATE)

endclass : ral_reg_STATE


class ral_reg_CTRL extends uvm_reg;
	rand uvm_reg_field HIGH_SPEED;
	rand uvm_reg_field RX_OR_EN;
	rand uvm_reg_field TX_OR_EN;
	rand uvm_reg_field RX_INT_EN;
	rand uvm_reg_field TX_INT_EN;
	rand uvm_reg_field RX_EN;
	rand uvm_reg_field TX_EN;

	function new(string name = "CTRL");
		super.new(name, 8,build_coverage(UVM_NO_COVERAGE));
	endfunction: new
   virtual function void build();
      this.HIGH_SPEED = uvm_reg_field::type_id::create("HIGH_SPEED",,get_full_name());
      this.HIGH_SPEED.configure(this, 1, 6, "RW", 0, 1'b0, 1, 0, 0);
      this.RX_OR_EN = uvm_reg_field::type_id::create("RX_OR_EN",,get_full_name());
      this.RX_OR_EN.configure(this, 1, 5, "RW", 0, 1'b0, 1, 0, 0);
      this.TX_OR_EN = uvm_reg_field::type_id::create("TX_OR_EN",,get_full_name());
      this.TX_OR_EN.configure(this, 1, 4, "RW", 0, 1'b0, 1, 0, 0);
      this.RX_INT_EN = uvm_reg_field::type_id::create("RX_INT_EN",,get_full_name());
      this.RX_INT_EN.configure(this, 1, 3, "RW", 0, 1'b0, 1, 0, 0);
      this.TX_INT_EN = uvm_reg_field::type_id::create("TX_INT_EN",,get_full_name());
      this.TX_INT_EN.configure(this, 1, 2, "RW", 0, 1'b0, 1, 0, 0);
      this.RX_EN = uvm_reg_field::type_id::create("RX_EN",,get_full_name());
      this.RX_EN.configure(this, 1, 1, "RW", 0, 1'b0, 1, 0, 0);
      this.TX_EN = uvm_reg_field::type_id::create("TX_EN",,get_full_name());
      this.TX_EN.configure(this, 1, 0, "RW", 0, 1'b0, 1, 0, 0);
   endfunction: build

	`uvm_object_utils(ral_reg_CTRL)

endclass : ral_reg_CTRL


class ral_reg_INTCLEAR extends uvm_reg;
	rand uvm_reg_field RX_OR_INT;
	rand uvm_reg_field TX_OR_INT;
	rand uvm_reg_field RX_INT;
	rand uvm_reg_field TX_INT;

	function new(string name = "INTCLEAR");
		super.new(name, 8,build_coverage(UVM_NO_COVERAGE));
	endfunction: new
   virtual function void build();
      this.RX_OR_INT = uvm_reg_field::type_id::create("RX_OR_INT",,get_full_name());
      this.RX_OR_INT.configure(this, 1, 3, "RW", 0, 1'b0, 1, 0, 0);
      this.TX_OR_INT = uvm_reg_field::type_id::create("TX_OR_INT",,get_full_name());
      this.TX_OR_INT.configure(this, 1, 2, "RW", 0, 1'b0, 1, 0, 0);
      this.RX_INT = uvm_reg_field::type_id::create("RX_INT",,get_full_name());
      this.RX_INT.configure(this, 1, 1, "RW", 0, 1'b0, 1, 0, 0);
      this.TX_INT = uvm_reg_field::type_id::create("TX_INT",,get_full_name());
      this.TX_INT.configure(this, 1, 0, "RW", 0, 1'b0, 1, 0, 0);
   endfunction: build

	`uvm_object_utils(ral_reg_INTCLEAR)

endclass : ral_reg_INTCLEAR


class ral_reg_BAUDDIV extends uvm_reg;
	rand uvm_reg_field BAUD;

	function new(string name = "BAUDDIV");
		super.new(name, 32,build_coverage(UVM_NO_COVERAGE));
	endfunction: new
   virtual function void build();
      this.BAUD = uvm_reg_field::type_id::create("BAUD",,get_full_name());
      this.BAUD.configure(this, 20, 0, "RW", 0, 1'b0, 1, 0, 1);
   endfunction: build

	`uvm_object_utils(ral_reg_BAUDDIV)

endclass : ral_reg_BAUDDIV


class ral_uart extends uvm_reg_block;
	rand ral_reg_DATA DATA;
	rand ral_reg_STATE STATE;
	rand ral_reg_CTRL CTRL;
	rand ral_reg_INTCLEAR INTCLEAR;
	rand ral_reg_BAUDDIV BAUDDIV;
	rand uvm_reg_field DATA_RTDATA;
	rand uvm_reg_field RTDATA;
	rand uvm_reg_field STATE_RX_OVERRUN;
	rand uvm_reg_field RX_OVERRUN;
	rand uvm_reg_field STATE_TX_OVERRUN;
	rand uvm_reg_field TX_OVERRUN;
	rand uvm_reg_field STATE_RX_FULL;
	rand uvm_reg_field RX_FULL;
	rand uvm_reg_field STATE_TX_FULL;
	rand uvm_reg_field TX_FULL;
	rand uvm_reg_field CTRL_HIGH_SPEED;
	rand uvm_reg_field HIGH_SPEED;
	rand uvm_reg_field CTRL_RX_OR_EN;
	rand uvm_reg_field RX_OR_EN;
	rand uvm_reg_field CTRL_TX_OR_EN;
	rand uvm_reg_field TX_OR_EN;
	rand uvm_reg_field CTRL_RX_INT_EN;
	rand uvm_reg_field RX_INT_EN;
	rand uvm_reg_field CTRL_TX_INT_EN;
	rand uvm_reg_field TX_INT_EN;
	rand uvm_reg_field CTRL_RX_EN;
	rand uvm_reg_field RX_EN;
	rand uvm_reg_field CTRL_TX_EN;
	rand uvm_reg_field TX_EN;
	rand uvm_reg_field INTCLEAR_RX_OR_INT;
	rand uvm_reg_field RX_OR_INT;
	rand uvm_reg_field INTCLEAR_TX_OR_INT;
	rand uvm_reg_field TX_OR_INT;
	rand uvm_reg_field INTCLEAR_RX_INT;
	rand uvm_reg_field RX_INT;
	rand uvm_reg_field INTCLEAR_TX_INT;
	rand uvm_reg_field TX_INT;
	rand uvm_reg_field BAUDDIV_BAUD;
	rand uvm_reg_field BAUD;

	function new(string name = "ral_uart");
		super.new(name, build_coverage(UVM_NO_COVERAGE));
	endfunction: new

   virtual function void build();
      this.default_map = create_map("", 0, 20, UVM_LITTLE_ENDIAN, 0);
      this.DATA = ral_reg_DATA::type_id::create("DATA",,get_full_name());
      this.DATA.configure(this, null, "");
      this.DATA.build();
         this.DATA.add_hdl_path('{
            '{"reg_tx_buf", 0, 8}
         });
      this.default_map.add_reg(this.DATA, `UVM_REG_ADDR_WIDTH'h0, "RW", 0);
		this.DATA_RTDATA = this.DATA.RTDATA;
		this.RTDATA = this.DATA.RTDATA;
      this.STATE = ral_reg_STATE::type_id::create("STATE",,get_full_name());
      this.STATE.configure(this, null, "");
      this.STATE.build();
      this.default_map.add_reg(this.STATE, `UVM_REG_ADDR_WIDTH'h4, "RW", 0);
		this.STATE_RX_OVERRUN = this.STATE.RX_OVERRUN;
		this.RX_OVERRUN = this.STATE.RX_OVERRUN;
		this.STATE_TX_OVERRUN = this.STATE.TX_OVERRUN;
		this.TX_OVERRUN = this.STATE.TX_OVERRUN;
		this.STATE_RX_FULL = this.STATE.RX_FULL;
		this.RX_FULL = this.STATE.RX_FULL;
		this.STATE_TX_FULL = this.STATE.TX_FULL;
		this.TX_FULL = this.STATE.TX_FULL;
      this.CTRL = ral_reg_CTRL::type_id::create("CTRL",,get_full_name());
      this.CTRL.configure(this, null, "");
      this.CTRL.build();
      this.default_map.add_reg(this.CTRL, `UVM_REG_ADDR_WIDTH'h8, "RW", 0);
		this.CTRL_HIGH_SPEED = this.CTRL.HIGH_SPEED;
		this.HIGH_SPEED = this.CTRL.HIGH_SPEED;
		this.CTRL_RX_OR_EN = this.CTRL.RX_OR_EN;
		this.RX_OR_EN = this.CTRL.RX_OR_EN;
		this.CTRL_TX_OR_EN = this.CTRL.TX_OR_EN;
		this.TX_OR_EN = this.CTRL.TX_OR_EN;
		this.CTRL_RX_INT_EN = this.CTRL.RX_INT_EN;
		this.RX_INT_EN = this.CTRL.RX_INT_EN;
		this.CTRL_TX_INT_EN = this.CTRL.TX_INT_EN;
		this.TX_INT_EN = this.CTRL.TX_INT_EN;
		this.CTRL_RX_EN = this.CTRL.RX_EN;
		this.RX_EN = this.CTRL.RX_EN;
		this.CTRL_TX_EN = this.CTRL.TX_EN;
		this.TX_EN = this.CTRL.TX_EN;
      this.INTCLEAR = ral_reg_INTCLEAR::type_id::create("INTCLEAR",,get_full_name());
      this.INTCLEAR.configure(this, null, "");
      this.INTCLEAR.build();
      this.default_map.add_reg(this.INTCLEAR, `UVM_REG_ADDR_WIDTH'hC, "RW", 0);
		this.INTCLEAR_RX_OR_INT = this.INTCLEAR.RX_OR_INT;
		this.RX_OR_INT = this.INTCLEAR.RX_OR_INT;
		this.INTCLEAR_TX_OR_INT = this.INTCLEAR.TX_OR_INT;
		this.TX_OR_INT = this.INTCLEAR.TX_OR_INT;
		this.INTCLEAR_RX_INT = this.INTCLEAR.RX_INT;
		this.RX_INT = this.INTCLEAR.RX_INT;
		this.INTCLEAR_TX_INT = this.INTCLEAR.TX_INT;
		this.TX_INT = this.INTCLEAR.TX_INT;
      this.BAUDDIV = ral_reg_BAUDDIV::type_id::create("BAUDDIV",,get_full_name());
      this.BAUDDIV.configure(this, null, "");
      this.BAUDDIV.build();
      this.default_map.add_reg(this.BAUDDIV, `UVM_REG_ADDR_WIDTH'h10, "RW", 0);
		this.BAUDDIV_BAUD = this.BAUDDIV.BAUD;
		this.BAUD = this.BAUDDIV.BAUD;
   endfunction : build

	`uvm_object_utils(ral_uart)

endclass : ral_uart



`endif
