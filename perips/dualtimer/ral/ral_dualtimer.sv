`ifndef RAL_RAL_DUALTIMER
`define RAL_RAL_DUALTIMER

import uvm_pkg::*;

class ral_reg_TIMER1LOAD extends uvm_reg;
	rand uvm_reg_field LOAD;

	function new(string name = "TIMER1LOAD");
		super.new(name, 32,build_coverage(UVM_NO_COVERAGE));
	endfunction: new
   virtual function void build();
      this.LOAD = uvm_reg_field::type_id::create("LOAD",,get_full_name());
      this.LOAD.configure(this, 32, 0, "RW", 0, 32'h0000_0000, 1, 0, 1);
   endfunction: build

	`uvm_object_utils(ral_reg_TIMER1LOAD)

endclass : ral_reg_TIMER1LOAD


class ral_reg_TIMER1VALUE extends uvm_reg;
	uvm_reg_field VALUE;

	function new(string name = "TIMER1VALUE");
		super.new(name, 32,build_coverage(UVM_NO_COVERAGE));
	endfunction: new
   virtual function void build();
      this.VALUE = uvm_reg_field::type_id::create("VALUE",,get_full_name());
      this.VALUE.configure(this, 32, 0, "RO", 0, 32'hFFFF_FFFF, 1, 0, 1);
   endfunction: build

	`uvm_object_utils(ral_reg_TIMER1VALUE)

endclass : ral_reg_TIMER1VALUE


class ral_reg_TIMER1CONTROL extends uvm_reg;
	rand uvm_reg_field EN;
	rand uvm_reg_field MODE;
	rand uvm_reg_field INT_EN;
	rand uvm_reg_field RESERVED;
	rand uvm_reg_field PRE;
	rand uvm_reg_field SIZE;
	rand uvm_reg_field ONESHOT;

	function new(string name = "TIMER1CONTROL");
		super.new(name, 32,build_coverage(UVM_NO_COVERAGE));
	endfunction: new
   virtual function void build();
      this.EN = uvm_reg_field::type_id::create("EN",,get_full_name());
      this.EN.configure(this, 1, 7, "RW", 0, 1'b0, 1, 0, 0);
      this.MODE = uvm_reg_field::type_id::create("MODE",,get_full_name());
      this.MODE.configure(this, 1, 6, "RW", 0, 1'b0, 1, 0, 0);
      this.INT_EN = uvm_reg_field::type_id::create("INT_EN",,get_full_name());
      this.INT_EN.configure(this, 1, 5, "RW", 0, 1'b1, 1, 0, 0);
      this.RESERVED = uvm_reg_field::type_id::create("RESERVED",,get_full_name());
      this.RESERVED.configure(this, 1, 4, "WO", 0, 1'b0, 1, 0, 0);
      this.PRE = uvm_reg_field::type_id::create("PRE",,get_full_name());
      this.PRE.configure(this, 2, 2, "RW", 0, 2'b00, 1, 0, 0);
      this.SIZE = uvm_reg_field::type_id::create("SIZE",,get_full_name());
      this.SIZE.configure(this, 1, 1, "RW", 0, 1'b0, 1, 0, 0);
      this.ONESHOT = uvm_reg_field::type_id::create("ONESHOT",,get_full_name());
      this.ONESHOT.configure(this, 1, 0, "RW", 0, 1'b0, 1, 0, 0);
   endfunction: build

	`uvm_object_utils(ral_reg_TIMER1CONTROL)

endclass : ral_reg_TIMER1CONTROL


class ral_reg_TIMER1INTCLR extends uvm_reg;
	rand uvm_reg_field INT;

	function new(string name = "TIMER1INTCLR");
		super.new(name, 32,build_coverage(UVM_NO_COVERAGE));
	endfunction: new
   virtual function void build();
      this.INT = uvm_reg_field::type_id::create("INT",,get_full_name());
      this.INT.configure(this, 1, 0, "WO", 0, 1'h0, 0, 0, 1);
   endfunction: build

	`uvm_object_utils(ral_reg_TIMER1INTCLR)

endclass : ral_reg_TIMER1INTCLR


class ral_reg_TIMER1RIS extends uvm_reg;
	uvm_reg_field RIS;

	function new(string name = "TIMER1RIS");
		super.new(name, 32,build_coverage(UVM_NO_COVERAGE));
	endfunction: new
   virtual function void build();
      this.RIS = uvm_reg_field::type_id::create("RIS",,get_full_name());
      this.RIS.configure(this, 1, 0, "RO", 0, 1'h0, 1, 0, 1);
   endfunction: build

	`uvm_object_utils(ral_reg_TIMER1RIS)

endclass : ral_reg_TIMER1RIS


class ral_reg_TIMER1MIS extends uvm_reg;
	uvm_reg_field RIS;

	function new(string name = "TIMER1MIS");
		super.new(name, 32,build_coverage(UVM_NO_COVERAGE));
	endfunction: new
   virtual function void build();
      this.RIS = uvm_reg_field::type_id::create("RIS",,get_full_name());
      this.RIS.configure(this, 1, 0, "RO", 0, 1'h0, 1, 0, 1);
   endfunction: build

	`uvm_object_utils(ral_reg_TIMER1MIS)

endclass : ral_reg_TIMER1MIS


class ral_reg_TIMER1BGLOAD extends uvm_reg;
	rand uvm_reg_field BGLOAD;

	function new(string name = "TIMER1BGLOAD");
		super.new(name, 32,build_coverage(UVM_NO_COVERAGE));
	endfunction: new
   virtual function void build();
      this.BGLOAD = uvm_reg_field::type_id::create("BGLOAD",,get_full_name());
      this.BGLOAD.configure(this, 32, 0, "RW", 0, 32'h0000_0000, 1, 0, 1);
   endfunction: build

	`uvm_object_utils(ral_reg_TIMER1BGLOAD)

endclass : ral_reg_TIMER1BGLOAD


class ral_dualtimer extends uvm_reg_block;
	rand ral_reg_TIMER1LOAD TIMER1LOAD;
	rand ral_reg_TIMER1VALUE TIMER1VALUE;
	rand ral_reg_TIMER1CONTROL TIMER1CONTROL;
	rand ral_reg_TIMER1INTCLR TIMER1INTCLR;
	rand ral_reg_TIMER1RIS TIMER1RIS;
	rand ral_reg_TIMER1MIS TIMER1MIS;
	rand ral_reg_TIMER1BGLOAD TIMER1BGLOAD;
	rand uvm_reg_field TIMER1LOAD_LOAD;
	rand uvm_reg_field LOAD;
	uvm_reg_field TIMER1VALUE_VALUE;
	uvm_reg_field VALUE;
	rand uvm_reg_field TIMER1CONTROL_EN;
	rand uvm_reg_field EN;
	rand uvm_reg_field TIMER1CONTROL_MODE;
	rand uvm_reg_field MODE;
	rand uvm_reg_field TIMER1CONTROL_INT_EN;
	rand uvm_reg_field INT_EN;
	rand uvm_reg_field TIMER1CONTROL_RESERVED;
	rand uvm_reg_field RESERVED;
	rand uvm_reg_field TIMER1CONTROL_PRE;
	rand uvm_reg_field PRE;
	rand uvm_reg_field TIMER1CONTROL_SIZE;
	rand uvm_reg_field SIZE;
	rand uvm_reg_field TIMER1CONTROL_ONESHOT;
	rand uvm_reg_field ONESHOT;
	rand uvm_reg_field TIMER1INTCLR_INT;
	rand uvm_reg_field INT;
	uvm_reg_field TIMER1RIS_RIS;
	uvm_reg_field TIMER1MIS_RIS;
	rand uvm_reg_field TIMER1BGLOAD_BGLOAD;
	rand uvm_reg_field BGLOAD;

	function new(string name = "ral_dualtimer");
		super.new(name, build_coverage(UVM_NO_COVERAGE));
	endfunction: new

   virtual function void build();
      this.default_map = create_map("", 0, 28, UVM_LITTLE_ENDIAN, 0);
      this.TIMER1LOAD = ral_reg_TIMER1LOAD::type_id::create("TIMER1LOAD",,get_full_name());
      this.TIMER1LOAD.configure(this, null, "");
      this.TIMER1LOAD.build();
      this.default_map.add_reg(this.TIMER1LOAD, `UVM_REG_ADDR_WIDTH'h0, "RW", 0);
		this.TIMER1LOAD_LOAD = this.TIMER1LOAD.LOAD;
		this.LOAD = this.TIMER1LOAD.LOAD;
      this.TIMER1VALUE = ral_reg_TIMER1VALUE::type_id::create("TIMER1VALUE",,get_full_name());
      this.TIMER1VALUE.configure(this, null, "");
      this.TIMER1VALUE.build();
      this.default_map.add_reg(this.TIMER1VALUE, `UVM_REG_ADDR_WIDTH'h4, "RO", 0);
		this.TIMER1VALUE_VALUE = this.TIMER1VALUE.VALUE;
		this.VALUE = this.TIMER1VALUE.VALUE;
      this.TIMER1CONTROL = ral_reg_TIMER1CONTROL::type_id::create("TIMER1CONTROL",,get_full_name());
      this.TIMER1CONTROL.configure(this, null, "");
      this.TIMER1CONTROL.build();
      this.default_map.add_reg(this.TIMER1CONTROL, `UVM_REG_ADDR_WIDTH'h8, "RW", 0);
		this.TIMER1CONTROL_EN = this.TIMER1CONTROL.EN;
		this.EN = this.TIMER1CONTROL.EN;
		this.TIMER1CONTROL_MODE = this.TIMER1CONTROL.MODE;
		this.MODE = this.TIMER1CONTROL.MODE;
		this.TIMER1CONTROL_INT_EN = this.TIMER1CONTROL.INT_EN;
		this.INT_EN = this.TIMER1CONTROL.INT_EN;
		this.TIMER1CONTROL_RESERVED = this.TIMER1CONTROL.RESERVED;
		this.RESERVED = this.TIMER1CONTROL.RESERVED;
		this.TIMER1CONTROL_PRE = this.TIMER1CONTROL.PRE;
		this.PRE = this.TIMER1CONTROL.PRE;
		this.TIMER1CONTROL_SIZE = this.TIMER1CONTROL.SIZE;
		this.SIZE = this.TIMER1CONTROL.SIZE;
		this.TIMER1CONTROL_ONESHOT = this.TIMER1CONTROL.ONESHOT;
		this.ONESHOT = this.TIMER1CONTROL.ONESHOT;
      this.TIMER1INTCLR = ral_reg_TIMER1INTCLR::type_id::create("TIMER1INTCLR",,get_full_name());
      this.TIMER1INTCLR.configure(this, null, "");
      this.TIMER1INTCLR.build();
      this.default_map.add_reg(this.TIMER1INTCLR, `UVM_REG_ADDR_WIDTH'hC, "RW", 0);
		this.TIMER1INTCLR_INT = this.TIMER1INTCLR.INT;
		this.INT = this.TIMER1INTCLR.INT;
      this.TIMER1RIS = ral_reg_TIMER1RIS::type_id::create("TIMER1RIS",,get_full_name());
      this.TIMER1RIS.configure(this, null, "");
      this.TIMER1RIS.build();
      this.default_map.add_reg(this.TIMER1RIS, `UVM_REG_ADDR_WIDTH'h10, "RO", 0);
		this.TIMER1RIS_RIS = this.TIMER1RIS.RIS;
      this.TIMER1MIS = ral_reg_TIMER1MIS::type_id::create("TIMER1MIS",,get_full_name());
      this.TIMER1MIS.configure(this, null, "");
      this.TIMER1MIS.build();
      this.default_map.add_reg(this.TIMER1MIS, `UVM_REG_ADDR_WIDTH'h14, "RO", 0);
		this.TIMER1MIS_RIS = this.TIMER1MIS.RIS;
      this.TIMER1BGLOAD = ral_reg_TIMER1BGLOAD::type_id::create("TIMER1BGLOAD",,get_full_name());
      this.TIMER1BGLOAD.configure(this, null, "");
      this.TIMER1BGLOAD.build();
      this.default_map.add_reg(this.TIMER1BGLOAD, `UVM_REG_ADDR_WIDTH'h18, "RW", 0);
		this.TIMER1BGLOAD_BGLOAD = this.TIMER1BGLOAD.BGLOAD;
		this.BGLOAD = this.TIMER1BGLOAD.BGLOAD;
   endfunction : build

	`uvm_object_utils(ral_dualtimer)

endclass : ral_dualtimer



`endif
