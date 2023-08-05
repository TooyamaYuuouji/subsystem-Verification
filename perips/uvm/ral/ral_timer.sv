`ifndef RAL_RAL_TIMER
`define RAL_RAL_TIMER

import uvm_pkg::*;

class ral_reg_CTRL extends uvm_reg;
	rand uvm_reg_field INT_EN;
	rand uvm_reg_field EX;
	rand uvm_reg_field EX_EN;
	rand uvm_reg_field EN;

	function new(string name = "CTRL");
		super.new(name, 8,build_coverage(UVM_NO_COVERAGE));
	endfunction: new
   virtual function void build();
      this.INT_EN = uvm_reg_field::type_id::create("INT_EN",,get_full_name());
      this.INT_EN.configure(this, 1, 3, "RW", 0, 1'b0, 1, 0, 0);
      this.EX = uvm_reg_field::type_id::create("EX",,get_full_name());
      this.EX.configure(this, 1, 2, "RW", 0, 1'b0, 1, 0, 0);
      this.EX_EN = uvm_reg_field::type_id::create("EX_EN",,get_full_name());
      this.EX_EN.configure(this, 1, 1, "RW", 0, 1'b0, 1, 0, 0);
      this.EN = uvm_reg_field::type_id::create("EN",,get_full_name());
      this.EN.configure(this, 1, 0, "RW", 0, 1'b0, 1, 0, 0);
   endfunction: build

	`uvm_object_utils(ral_reg_CTRL)

endclass : ral_reg_CTRL


class ral_reg_VALUE extends uvm_reg;
	rand uvm_reg_field C_VAL;

	function new(string name = "VALUE");
		super.new(name, 32,build_coverage(UVM_NO_COVERAGE));
	endfunction: new
   virtual function void build();
      this.C_VAL = uvm_reg_field::type_id::create("C_VAL",,get_full_name());
      this.C_VAL.configure(this, 32, 0, "RW", 0, 32'd0, 1, 0, 1);
   endfunction: build

	`uvm_object_utils(ral_reg_VALUE)

endclass : ral_reg_VALUE


class ral_reg_RELOAD extends uvm_reg;
	rand uvm_reg_field R_VALUE;

	function new(string name = "RELOAD");
		super.new(name, 32,build_coverage(UVM_NO_COVERAGE));
	endfunction: new
   virtual function void build();
      this.R_VALUE = uvm_reg_field::type_id::create("R_VALUE",,get_full_name());
      this.R_VALUE.configure(this, 32, 0, "RW", 0, 32'd0, 1, 0, 1);
   endfunction: build

	`uvm_object_utils(ral_reg_RELOAD)

endclass : ral_reg_RELOAD


class ral_reg_INTCLEAR extends uvm_reg;
	rand uvm_reg_field INT;

	function new(string name = "INTCLEAR");
		super.new(name, 8,build_coverage(UVM_NO_COVERAGE));
	endfunction: new
   virtual function void build();
      this.INT = uvm_reg_field::type_id::create("INT",,get_full_name());
      this.INT.configure(this, 1, 0, "RW", 0, 1'b0, 1, 0, 1);
   endfunction: build

	`uvm_object_utils(ral_reg_INTCLEAR)

endclass : ral_reg_INTCLEAR


class ral_timer extends uvm_reg_block;
	rand ral_reg_CTRL CTRL;
	rand ral_reg_VALUE VALUE;
	rand ral_reg_RELOAD RELOAD;
	rand ral_reg_INTCLEAR INTCLEAR;
	rand uvm_reg_field CTRL_INT_EN;
	rand uvm_reg_field INT_EN;
	rand uvm_reg_field CTRL_EX;
	rand uvm_reg_field EX;
	rand uvm_reg_field CTRL_EX_EN;
	rand uvm_reg_field EX_EN;
	rand uvm_reg_field CTRL_EN;
	rand uvm_reg_field EN;
	rand uvm_reg_field VALUE_C_VAL;
	rand uvm_reg_field C_VAL;
	rand uvm_reg_field RELOAD_R_VALUE;
	rand uvm_reg_field R_VALUE;
	rand uvm_reg_field INTCLEAR_INT;
	rand uvm_reg_field INT;

	function new(string name = "ral_timer");
		super.new(name, build_coverage(UVM_NO_COVERAGE));
	endfunction: new

   virtual function void build();
      this.default_map = create_map("", 0, 9, UVM_LITTLE_ENDIAN, 0);
      this.CTRL = ral_reg_CTRL::type_id::create("CTRL",,get_full_name());
      this.CTRL.configure(this, null, "");
      this.CTRL.build();
      this.default_map.add_reg(this.CTRL, `UVM_REG_ADDR_WIDTH'h0, "RW", 0);
		this.CTRL_INT_EN = this.CTRL.INT_EN;
		this.INT_EN = this.CTRL.INT_EN;
		this.CTRL_EX = this.CTRL.EX;
		this.EX = this.CTRL.EX;
		this.CTRL_EX_EN = this.CTRL.EX_EN;
		this.EX_EN = this.CTRL.EX_EN;
		this.CTRL_EN = this.CTRL.EN;
		this.EN = this.CTRL.EN;
      this.VALUE = ral_reg_VALUE::type_id::create("VALUE",,get_full_name());
      this.VALUE.configure(this, null, "");
      this.VALUE.build();
      this.default_map.add_reg(this.VALUE, `UVM_REG_ADDR_WIDTH'h4, "RW", 0);
		this.VALUE_C_VAL = this.VALUE.C_VAL;
		this.C_VAL = this.VALUE.C_VAL;
      this.RELOAD = ral_reg_RELOAD::type_id::create("RELOAD",,get_full_name());
      this.RELOAD.configure(this, null, "");
      this.RELOAD.build();
      this.default_map.add_reg(this.RELOAD, `UVM_REG_ADDR_WIDTH'h8, "RW", 0);
		this.RELOAD_R_VALUE = this.RELOAD.R_VALUE;
		this.R_VALUE = this.RELOAD.R_VALUE;
      this.INTCLEAR = ral_reg_INTCLEAR::type_id::create("INTCLEAR",,get_full_name());
      this.INTCLEAR.configure(this, null, "");
      this.INTCLEAR.build();
      this.default_map.add_reg(this.INTCLEAR, `UVM_REG_ADDR_WIDTH'hC, "RW", 0);
		this.INTCLEAR_INT = this.INTCLEAR.INT;
		this.INT = this.INTCLEAR.INT;
   endfunction : build

	`uvm_object_utils(ral_timer)

endclass : ral_timer



`endif
