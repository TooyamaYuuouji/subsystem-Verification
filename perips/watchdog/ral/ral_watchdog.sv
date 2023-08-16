`ifndef RAL_RAL_WATCHDOG
`define RAL_RAL_WATCHDOG

import uvm_pkg::*;

class ral_reg_WDOGLOAD extends uvm_reg;
	rand uvm_reg_field LOAD_VALUE;

	function new(string name = "WDOGLOAD");
		super.new(name, 32,build_coverage(UVM_NO_COVERAGE));
	endfunction: new
   virtual function void build();
      this.LOAD_VALUE = uvm_reg_field::type_id::create("LOAD_VALUE",,get_full_name());
      this.LOAD_VALUE.configure(this, 32, 0, "RW", 0, 32'hffffffff, 1, 0, 1);
   endfunction: build

	`uvm_object_utils(ral_reg_WDOGLOAD)

endclass : ral_reg_WDOGLOAD


class ral_reg_WDOGVALUE extends uvm_reg;
	uvm_reg_field VALUE;

	function new(string name = "WDOGVALUE");
		super.new(name, 32,build_coverage(UVM_NO_COVERAGE));
	endfunction: new
   virtual function void build();
      this.VALUE = uvm_reg_field::type_id::create("VALUE",,get_full_name());
      this.VALUE.configure(this, 32, 0, "RO", 0, 32'hffffffff, 1, 0, 1);
   endfunction: build

	`uvm_object_utils(ral_reg_WDOGVALUE)

endclass : ral_reg_WDOGVALUE


class ral_reg_WDOGCONTROL extends uvm_reg;
	rand uvm_reg_field CONTROL;

	function new(string name = "WDOGCONTROL");
		super.new(name, 32,build_coverage(UVM_NO_COVERAGE));
	endfunction: new
   virtual function void build();
      this.CONTROL = uvm_reg_field::type_id::create("CONTROL",,get_full_name());
      this.CONTROL.configure(this, 2, 0, "RW", 0, 2'b00, 1, 0, 1);
   endfunction: build

	`uvm_object_utils(ral_reg_WDOGCONTROL)

endclass : ral_reg_WDOGCONTROL


class ral_reg_WDOGINTCLR extends uvm_reg;
	rand uvm_reg_field INT;

	function new(string name = "WDOGINTCLR");
		super.new(name, 32,build_coverage(UVM_NO_COVERAGE));
	endfunction: new
   virtual function void build();
      this.INT = uvm_reg_field::type_id::create("INT",,get_full_name());
      this.INT.configure(this, 1, 0, "WO", 0, 1'b0, 1, 0, 1);
   endfunction: build

	`uvm_object_utils(ral_reg_WDOGINTCLR)

endclass : ral_reg_WDOGINTCLR


class ral_reg_WDOGRIS extends uvm_reg;
	uvm_reg_field RIS;

	function new(string name = "WDOGRIS");
		super.new(name, 32,build_coverage(UVM_NO_COVERAGE));
	endfunction: new
   virtual function void build();
      this.RIS = uvm_reg_field::type_id::create("RIS",,get_full_name());
      this.RIS.configure(this, 1, 0, "RO", 0, 1'b0, 1, 0, 1);
   endfunction: build

	`uvm_object_utils(ral_reg_WDOGRIS)

endclass : ral_reg_WDOGRIS


class ral_reg_WDOGMIS extends uvm_reg;
	uvm_reg_field MIS;

	function new(string name = "WDOGMIS");
		super.new(name, 32,build_coverage(UVM_NO_COVERAGE));
	endfunction: new
   virtual function void build();
      this.MIS = uvm_reg_field::type_id::create("MIS",,get_full_name());
      this.MIS.configure(this, 1, 0, "RO", 0, 1'b0, 1, 0, 1);
   endfunction: build

	`uvm_object_utils(ral_reg_WDOGMIS)

endclass : ral_reg_WDOGMIS


class ral_reg_WDOGLOCK extends uvm_reg;
	rand uvm_reg_field LOCK;

	function new(string name = "WDOGLOCK");
		super.new(name, 32,build_coverage(UVM_NO_COVERAGE));
	endfunction: new
   virtual function void build();
      this.LOCK = uvm_reg_field::type_id::create("LOCK",,get_full_name());
      this.LOCK.configure(this, 32, 0, "RW", 0, 32'h0, 1, 0, 1);
   endfunction: build

	`uvm_object_utils(ral_reg_WDOGLOCK)

endclass : ral_reg_WDOGLOCK


class ral_reg_WDOGITCR extends uvm_reg;
	rand uvm_reg_field ITCR;

	function new(string name = "WDOGITCR");
		super.new(name, 32,build_coverage(UVM_NO_COVERAGE));
	endfunction: new
   virtual function void build();
      this.ITCR = uvm_reg_field::type_id::create("ITCR",,get_full_name());
      this.ITCR.configure(this, 1, 0, "RW", 0, 1'b0, 1, 0, 1);
   endfunction: build

	`uvm_object_utils(ral_reg_WDOGITCR)

endclass : ral_reg_WDOGITCR


class ral_reg_WDOGITOP extends uvm_reg;
	rand uvm_reg_field ITOP;

	function new(string name = "WDOGITOP");
		super.new(name, 32,build_coverage(UVM_NO_COVERAGE));
	endfunction: new
   virtual function void build();
      this.ITOP = uvm_reg_field::type_id::create("ITOP",,get_full_name());
      this.ITOP.configure(this, 2, 0, "WO", 0, 2'b0, 1, 0, 1);
   endfunction: build

	`uvm_object_utils(ral_reg_WDOGITOP)

endclass : ral_reg_WDOGITOP


class ral_reg_WDOGPERIPHID4 extends uvm_reg;
	uvm_reg_field PERIPHID4;

	function new(string name = "WDOGPERIPHID4");
		super.new(name, 32,build_coverage(UVM_NO_COVERAGE));
	endfunction: new
   virtual function void build();
      this.PERIPHID4 = uvm_reg_field::type_id::create("PERIPHID4",,get_full_name());
      this.PERIPHID4.configure(this, 8, 0, "RO", 0, 8'h04, 1, 0, 1);
   endfunction: build

	`uvm_object_utils(ral_reg_WDOGPERIPHID4)

endclass : ral_reg_WDOGPERIPHID4


class ral_reg_WDOGPERIPHID5a extends uvm_reg;
	uvm_reg_field PERIPHID5a;

	function new(string name = "WDOGPERIPHID5a");
		super.new(name, 32,build_coverage(UVM_NO_COVERAGE));
	endfunction: new
   virtual function void build();
      this.PERIPHID5a = uvm_reg_field::type_id::create("PERIPHID5a",,get_full_name());
      this.PERIPHID5a.configure(this, 8, 0, "RO", 0, 8'h00, 1, 0, 1);
   endfunction: build

	`uvm_object_utils(ral_reg_WDOGPERIPHID5a)

endclass : ral_reg_WDOGPERIPHID5a


class ral_reg_WDOGPERIPHID6a extends uvm_reg;
	uvm_reg_field PERIPHID6a;

	function new(string name = "WDOGPERIPHID6a");
		super.new(name, 32,build_coverage(UVM_NO_COVERAGE));
	endfunction: new
   virtual function void build();
      this.PERIPHID6a = uvm_reg_field::type_id::create("PERIPHID6a",,get_full_name());
      this.PERIPHID6a.configure(this, 8, 0, "RO", 0, 8'h00, 1, 0, 1);
   endfunction: build

	`uvm_object_utils(ral_reg_WDOGPERIPHID6a)

endclass : ral_reg_WDOGPERIPHID6a


class ral_reg_WDOGPERIPHID7a extends uvm_reg;
	uvm_reg_field PERIPHID7a;

	function new(string name = "WDOGPERIPHID7a");
		super.new(name, 32,build_coverage(UVM_NO_COVERAGE));
	endfunction: new
   virtual function void build();
      this.PERIPHID7a = uvm_reg_field::type_id::create("PERIPHID7a",,get_full_name());
      this.PERIPHID7a.configure(this, 8, 0, "RO", 0, 8'h00, 1, 0, 1);
   endfunction: build

	`uvm_object_utils(ral_reg_WDOGPERIPHID7a)

endclass : ral_reg_WDOGPERIPHID7a


class ral_reg_WDOGPERIPHID0 extends uvm_reg;
	uvm_reg_field PERIPHID0;

	function new(string name = "WDOGPERIPHID0");
		super.new(name, 32,build_coverage(UVM_NO_COVERAGE));
	endfunction: new
   virtual function void build();
      this.PERIPHID0 = uvm_reg_field::type_id::create("PERIPHID0",,get_full_name());
      this.PERIPHID0.configure(this, 8, 0, "RO", 0, 8'h24, 1, 0, 1);
   endfunction: build

	`uvm_object_utils(ral_reg_WDOGPERIPHID0)

endclass : ral_reg_WDOGPERIPHID0


class ral_reg_WDOGPERIPHID1 extends uvm_reg;
	uvm_reg_field PERIPHID1;

	function new(string name = "WDOGPERIPHID1");
		super.new(name, 32,build_coverage(UVM_NO_COVERAGE));
	endfunction: new
   virtual function void build();
      this.PERIPHID1 = uvm_reg_field::type_id::create("PERIPHID1",,get_full_name());
      this.PERIPHID1.configure(this, 8, 0, "RO", 0, 8'hB8, 1, 0, 1);
   endfunction: build

	`uvm_object_utils(ral_reg_WDOGPERIPHID1)

endclass : ral_reg_WDOGPERIPHID1


class ral_reg_WDOGPERIPHID2 extends uvm_reg;
	uvm_reg_field PERIPHID2;

	function new(string name = "WDOGPERIPHID2");
		super.new(name, 32,build_coverage(UVM_NO_COVERAGE));
	endfunction: new
   virtual function void build();
      this.PERIPHID2 = uvm_reg_field::type_id::create("PERIPHID2",,get_full_name());
      this.PERIPHID2.configure(this, 8, 0, "RO", 0, 8'h1B, 1, 0, 1);
   endfunction: build

	`uvm_object_utils(ral_reg_WDOGPERIPHID2)

endclass : ral_reg_WDOGPERIPHID2


class ral_reg_WDOGPERIPHID3 extends uvm_reg;
	uvm_reg_field PERIPHID3;

	function new(string name = "WDOGPERIPHID3");
		super.new(name, 32,build_coverage(UVM_NO_COVERAGE));
	endfunction: new
   virtual function void build();
      this.PERIPHID3 = uvm_reg_field::type_id::create("PERIPHID3",,get_full_name());
      this.PERIPHID3.configure(this, 8, 0, "RO", 0, 8'h00, 1, 0, 1);
   endfunction: build

	`uvm_object_utils(ral_reg_WDOGPERIPHID3)

endclass : ral_reg_WDOGPERIPHID3


class ral_reg_WDOGPCELLID0 extends uvm_reg;
	uvm_reg_field PCELLID0;

	function new(string name = "WDOGPCELLID0");
		super.new(name, 32,build_coverage(UVM_NO_COVERAGE));
	endfunction: new
   virtual function void build();
      this.PCELLID0 = uvm_reg_field::type_id::create("PCELLID0",,get_full_name());
      this.PCELLID0.configure(this, 8, 0, "RO", 0, 8'h0D, 1, 0, 1);
   endfunction: build

	`uvm_object_utils(ral_reg_WDOGPCELLID0)

endclass : ral_reg_WDOGPCELLID0


class ral_reg_WDOGPCELLID1 extends uvm_reg;
	uvm_reg_field PCELLID1;

	function new(string name = "WDOGPCELLID1");
		super.new(name, 32,build_coverage(UVM_NO_COVERAGE));
	endfunction: new
   virtual function void build();
      this.PCELLID1 = uvm_reg_field::type_id::create("PCELLID1",,get_full_name());
      this.PCELLID1.configure(this, 8, 0, "RO", 0, 8'hF0, 1, 0, 1);
   endfunction: build

	`uvm_object_utils(ral_reg_WDOGPCELLID1)

endclass : ral_reg_WDOGPCELLID1


class ral_reg_WDOGPCELLID2 extends uvm_reg;
	uvm_reg_field PCELLID2;

	function new(string name = "WDOGPCELLID2");
		super.new(name, 32,build_coverage(UVM_NO_COVERAGE));
	endfunction: new
   virtual function void build();
      this.PCELLID2 = uvm_reg_field::type_id::create("PCELLID2",,get_full_name());
      this.PCELLID2.configure(this, 8, 0, "RO", 0, 8'h05, 1, 0, 1);
   endfunction: build

	`uvm_object_utils(ral_reg_WDOGPCELLID2)

endclass : ral_reg_WDOGPCELLID2


class ral_reg_WDOGPCELLID3 extends uvm_reg;
	uvm_reg_field PCELLID3;

	function new(string name = "WDOGPCELLID3");
		super.new(name, 32,build_coverage(UVM_NO_COVERAGE));
	endfunction: new
   virtual function void build();
      this.PCELLID3 = uvm_reg_field::type_id::create("PCELLID3",,get_full_name());
      this.PCELLID3.configure(this, 8, 0, "RO", 0, 8'hB1, 1, 0, 1);
   endfunction: build

	`uvm_object_utils(ral_reg_WDOGPCELLID3)

endclass : ral_reg_WDOGPCELLID3


class ral_reg_WDOGRESERVE extends uvm_reg;
	uvm_reg_field RESERVE;

	function new(string name = "WDOGRESERVE");
		super.new(name, 32,build_coverage(UVM_NO_COVERAGE));
	endfunction: new
   virtual function void build();
      this.RESERVE = uvm_reg_field::type_id::create("RESERVE",,get_full_name());
      this.RESERVE.configure(this, 8, 0, "RO", 0, 8'h0, 1, 0, 1);
   endfunction: build

	`uvm_object_utils(ral_reg_WDOGRESERVE)

endclass : ral_reg_WDOGRESERVE


class ral_watchdog extends uvm_reg_block;
	rand ral_reg_WDOGLOAD WDOGLOAD;
	rand ral_reg_WDOGVALUE WDOGVALUE;
	rand ral_reg_WDOGCONTROL WDOGCONTROL;
	rand ral_reg_WDOGINTCLR WDOGINTCLR;
	rand ral_reg_WDOGRIS WDOGRIS;
	rand ral_reg_WDOGMIS WDOGMIS;
	rand ral_reg_WDOGLOCK WDOGLOCK;
	rand ral_reg_WDOGITCR WDOGITCR;
	rand ral_reg_WDOGITOP WDOGITOP;
	rand ral_reg_WDOGPERIPHID4 WDOGPERIPHID4;
	rand ral_reg_WDOGPERIPHID5a WDOGPERIPHID5a;
	rand ral_reg_WDOGPERIPHID6a WDOGPERIPHID6a;
	rand ral_reg_WDOGPERIPHID7a WDOGPERIPHID7a;
	rand ral_reg_WDOGPERIPHID0 WDOGPERIPHID0;
	rand ral_reg_WDOGPERIPHID1 WDOGPERIPHID1;
	rand ral_reg_WDOGPERIPHID2 WDOGPERIPHID2;
	rand ral_reg_WDOGPERIPHID3 WDOGPERIPHID3;
	rand ral_reg_WDOGPCELLID0 WDOGPCELLID0;
	rand ral_reg_WDOGPCELLID1 WDOGPCELLID1;
	rand ral_reg_WDOGPCELLID2 WDOGPCELLID2;
	rand ral_reg_WDOGPCELLID3 WDOGPCELLID3;
	rand ral_reg_WDOGRESERVE WDOGRESERVE;
	rand uvm_reg_field WDOGLOAD_LOAD_VALUE;
	rand uvm_reg_field LOAD_VALUE;
	uvm_reg_field WDOGVALUE_VALUE;
	uvm_reg_field VALUE;
	rand uvm_reg_field WDOGCONTROL_CONTROL;
	rand uvm_reg_field CONTROL;
	rand uvm_reg_field WDOGINTCLR_INT;
	rand uvm_reg_field INT;
	uvm_reg_field WDOGRIS_RIS;
	uvm_reg_field RIS;
	uvm_reg_field WDOGMIS_MIS;
	uvm_reg_field MIS;
	rand uvm_reg_field WDOGLOCK_LOCK;
	rand uvm_reg_field LOCK;
	rand uvm_reg_field WDOGITCR_ITCR;
	rand uvm_reg_field ITCR;
	rand uvm_reg_field WDOGITOP_ITOP;
	rand uvm_reg_field ITOP;
	uvm_reg_field WDOGPERIPHID4_PERIPHID4;
	uvm_reg_field PERIPHID4;
	uvm_reg_field WDOGPERIPHID5a_PERIPHID5a;
	uvm_reg_field PERIPHID5a;
	uvm_reg_field WDOGPERIPHID6a_PERIPHID6a;
	uvm_reg_field PERIPHID6a;
	uvm_reg_field WDOGPERIPHID7a_PERIPHID7a;
	uvm_reg_field PERIPHID7a;
	uvm_reg_field WDOGPERIPHID0_PERIPHID0;
	uvm_reg_field PERIPHID0;
	uvm_reg_field WDOGPERIPHID1_PERIPHID1;
	uvm_reg_field PERIPHID1;
	uvm_reg_field WDOGPERIPHID2_PERIPHID2;
	uvm_reg_field PERIPHID2;
	uvm_reg_field WDOGPERIPHID3_PERIPHID3;
	uvm_reg_field PERIPHID3;
	uvm_reg_field WDOGPCELLID0_PCELLID0;
	uvm_reg_field PCELLID0;
	uvm_reg_field WDOGPCELLID1_PCELLID1;
	uvm_reg_field PCELLID1;
	uvm_reg_field WDOGPCELLID2_PCELLID2;
	uvm_reg_field PCELLID2;
	uvm_reg_field WDOGPCELLID3_PCELLID3;
	uvm_reg_field PCELLID3;
	uvm_reg_field WDOGRESERVE_RESERVE;
	uvm_reg_field RESERVE;

	function new(string name = "ral_watchdog");
		super.new(name, build_coverage(UVM_NO_COVERAGE));
	endfunction: new

   virtual function void build();
      this.default_map = create_map("", 0, 100, UVM_LITTLE_ENDIAN, 0);
      this.WDOGLOAD = ral_reg_WDOGLOAD::type_id::create("WDOGLOAD",,get_full_name());
      this.WDOGLOAD.configure(this, null, "");
      this.WDOGLOAD.build();
      this.default_map.add_reg(this.WDOGLOAD, `UVM_REG_ADDR_WIDTH'h0, "RW", 0);
		this.WDOGLOAD_LOAD_VALUE = this.WDOGLOAD.LOAD_VALUE;
		this.LOAD_VALUE = this.WDOGLOAD.LOAD_VALUE;
      this.WDOGVALUE = ral_reg_WDOGVALUE::type_id::create("WDOGVALUE",,get_full_name());
      this.WDOGVALUE.configure(this, null, "");
      this.WDOGVALUE.build();
      this.default_map.add_reg(this.WDOGVALUE, `UVM_REG_ADDR_WIDTH'h4, "RO", 0);
		this.WDOGVALUE_VALUE = this.WDOGVALUE.VALUE;
		this.VALUE = this.WDOGVALUE.VALUE;
      this.WDOGCONTROL = ral_reg_WDOGCONTROL::type_id::create("WDOGCONTROL",,get_full_name());
      this.WDOGCONTROL.configure(this, null, "");
      this.WDOGCONTROL.build();
      this.default_map.add_reg(this.WDOGCONTROL, `UVM_REG_ADDR_WIDTH'h8, "RW", 0);
		this.WDOGCONTROL_CONTROL = this.WDOGCONTROL.CONTROL;
		this.CONTROL = this.WDOGCONTROL.CONTROL;
      this.WDOGINTCLR = ral_reg_WDOGINTCLR::type_id::create("WDOGINTCLR",,get_full_name());
      this.WDOGINTCLR.configure(this, null, "");
      this.WDOGINTCLR.build();
      this.default_map.add_reg(this.WDOGINTCLR, `UVM_REG_ADDR_WIDTH'hC, "RW", 0);
		this.WDOGINTCLR_INT = this.WDOGINTCLR.INT;
		this.INT = this.WDOGINTCLR.INT;
      this.WDOGRIS = ral_reg_WDOGRIS::type_id::create("WDOGRIS",,get_full_name());
      this.WDOGRIS.configure(this, null, "");
      this.WDOGRIS.build();
      this.default_map.add_reg(this.WDOGRIS, `UVM_REG_ADDR_WIDTH'h10, "RO", 0);
		this.WDOGRIS_RIS = this.WDOGRIS.RIS;
		this.RIS = this.WDOGRIS.RIS;
      this.WDOGMIS = ral_reg_WDOGMIS::type_id::create("WDOGMIS",,get_full_name());
      this.WDOGMIS.configure(this, null, "");
      this.WDOGMIS.build();
      this.default_map.add_reg(this.WDOGMIS, `UVM_REG_ADDR_WIDTH'h14, "RO", 0);
		this.WDOGMIS_MIS = this.WDOGMIS.MIS;
		this.MIS = this.WDOGMIS.MIS;
      this.WDOGLOCK = ral_reg_WDOGLOCK::type_id::create("WDOGLOCK",,get_full_name());
      this.WDOGLOCK.configure(this, null, "");
      this.WDOGLOCK.build();
      this.default_map.add_reg(this.WDOGLOCK, `UVM_REG_ADDR_WIDTH'hC00, "RW", 0);
		this.WDOGLOCK_LOCK = this.WDOGLOCK.LOCK;
		this.LOCK = this.WDOGLOCK.LOCK;
      this.WDOGITCR = ral_reg_WDOGITCR::type_id::create("WDOGITCR",,get_full_name());
      this.WDOGITCR.configure(this, null, "");
      this.WDOGITCR.build();
      this.default_map.add_reg(this.WDOGITCR, `UVM_REG_ADDR_WIDTH'hF00, "RW", 0);
		this.WDOGITCR_ITCR = this.WDOGITCR.ITCR;
		this.ITCR = this.WDOGITCR.ITCR;
      this.WDOGITOP = ral_reg_WDOGITOP::type_id::create("WDOGITOP",,get_full_name());
      this.WDOGITOP.configure(this, null, "");
      this.WDOGITOP.build();
      this.default_map.add_reg(this.WDOGITOP, `UVM_REG_ADDR_WIDTH'hF04, "RW", 0);
		this.WDOGITOP_ITOP = this.WDOGITOP.ITOP;
		this.ITOP = this.WDOGITOP.ITOP;
      this.WDOGPERIPHID4 = ral_reg_WDOGPERIPHID4::type_id::create("WDOGPERIPHID4",,get_full_name());
      this.WDOGPERIPHID4.configure(this, null, "");
      this.WDOGPERIPHID4.build();
      this.default_map.add_reg(this.WDOGPERIPHID4, `UVM_REG_ADDR_WIDTH'hFD0, "RO", 0);
		this.WDOGPERIPHID4_PERIPHID4 = this.WDOGPERIPHID4.PERIPHID4;
		this.PERIPHID4 = this.WDOGPERIPHID4.PERIPHID4;
      this.WDOGPERIPHID5a = ral_reg_WDOGPERIPHID5a::type_id::create("WDOGPERIPHID5a",,get_full_name());
      this.WDOGPERIPHID5a.configure(this, null, "");
      this.WDOGPERIPHID5a.build();
      this.default_map.add_reg(this.WDOGPERIPHID5a, `UVM_REG_ADDR_WIDTH'hFD4, "RO", 0);
		this.WDOGPERIPHID5a_PERIPHID5a = this.WDOGPERIPHID5a.PERIPHID5a;
		this.PERIPHID5a = this.WDOGPERIPHID5a.PERIPHID5a;
      this.WDOGPERIPHID6a = ral_reg_WDOGPERIPHID6a::type_id::create("WDOGPERIPHID6a",,get_full_name());
      this.WDOGPERIPHID6a.configure(this, null, "");
      this.WDOGPERIPHID6a.build();
      this.default_map.add_reg(this.WDOGPERIPHID6a, `UVM_REG_ADDR_WIDTH'hFD8, "RO", 0);
		this.WDOGPERIPHID6a_PERIPHID6a = this.WDOGPERIPHID6a.PERIPHID6a;
		this.PERIPHID6a = this.WDOGPERIPHID6a.PERIPHID6a;
      this.WDOGPERIPHID7a = ral_reg_WDOGPERIPHID7a::type_id::create("WDOGPERIPHID7a",,get_full_name());
      this.WDOGPERIPHID7a.configure(this, null, "");
      this.WDOGPERIPHID7a.build();
      this.default_map.add_reg(this.WDOGPERIPHID7a, `UVM_REG_ADDR_WIDTH'hFDC, "RO", 0);
		this.WDOGPERIPHID7a_PERIPHID7a = this.WDOGPERIPHID7a.PERIPHID7a;
		this.PERIPHID7a = this.WDOGPERIPHID7a.PERIPHID7a;
      this.WDOGPERIPHID0 = ral_reg_WDOGPERIPHID0::type_id::create("WDOGPERIPHID0",,get_full_name());
      this.WDOGPERIPHID0.configure(this, null, "");
      this.WDOGPERIPHID0.build();
      this.default_map.add_reg(this.WDOGPERIPHID0, `UVM_REG_ADDR_WIDTH'hFE0, "RO", 0);
		this.WDOGPERIPHID0_PERIPHID0 = this.WDOGPERIPHID0.PERIPHID0;
		this.PERIPHID0 = this.WDOGPERIPHID0.PERIPHID0;
      this.WDOGPERIPHID1 = ral_reg_WDOGPERIPHID1::type_id::create("WDOGPERIPHID1",,get_full_name());
      this.WDOGPERIPHID1.configure(this, null, "");
      this.WDOGPERIPHID1.build();
      this.default_map.add_reg(this.WDOGPERIPHID1, `UVM_REG_ADDR_WIDTH'hFE4, "RO", 0);
		this.WDOGPERIPHID1_PERIPHID1 = this.WDOGPERIPHID1.PERIPHID1;
		this.PERIPHID1 = this.WDOGPERIPHID1.PERIPHID1;
      this.WDOGPERIPHID2 = ral_reg_WDOGPERIPHID2::type_id::create("WDOGPERIPHID2",,get_full_name());
      this.WDOGPERIPHID2.configure(this, null, "");
      this.WDOGPERIPHID2.build();
      this.default_map.add_reg(this.WDOGPERIPHID2, `UVM_REG_ADDR_WIDTH'hFE8, "RO", 0);
		this.WDOGPERIPHID2_PERIPHID2 = this.WDOGPERIPHID2.PERIPHID2;
		this.PERIPHID2 = this.WDOGPERIPHID2.PERIPHID2;
      this.WDOGPERIPHID3 = ral_reg_WDOGPERIPHID3::type_id::create("WDOGPERIPHID3",,get_full_name());
      this.WDOGPERIPHID3.configure(this, null, "");
      this.WDOGPERIPHID3.build();
      this.default_map.add_reg(this.WDOGPERIPHID3, `UVM_REG_ADDR_WIDTH'hFEC, "RO", 0);
		this.WDOGPERIPHID3_PERIPHID3 = this.WDOGPERIPHID3.PERIPHID3;
		this.PERIPHID3 = this.WDOGPERIPHID3.PERIPHID3;
      this.WDOGPCELLID0 = ral_reg_WDOGPCELLID0::type_id::create("WDOGPCELLID0",,get_full_name());
      this.WDOGPCELLID0.configure(this, null, "");
      this.WDOGPCELLID0.build();
      this.default_map.add_reg(this.WDOGPCELLID0, `UVM_REG_ADDR_WIDTH'hFF0, "RO", 0);
		this.WDOGPCELLID0_PCELLID0 = this.WDOGPCELLID0.PCELLID0;
		this.PCELLID0 = this.WDOGPCELLID0.PCELLID0;
      this.WDOGPCELLID1 = ral_reg_WDOGPCELLID1::type_id::create("WDOGPCELLID1",,get_full_name());
      this.WDOGPCELLID1.configure(this, null, "");
      this.WDOGPCELLID1.build();
      this.default_map.add_reg(this.WDOGPCELLID1, `UVM_REG_ADDR_WIDTH'hFF4, "RO", 0);
		this.WDOGPCELLID1_PCELLID1 = this.WDOGPCELLID1.PCELLID1;
		this.PCELLID1 = this.WDOGPCELLID1.PCELLID1;
      this.WDOGPCELLID2 = ral_reg_WDOGPCELLID2::type_id::create("WDOGPCELLID2",,get_full_name());
      this.WDOGPCELLID2.configure(this, null, "");
      this.WDOGPCELLID2.build();
      this.default_map.add_reg(this.WDOGPCELLID2, `UVM_REG_ADDR_WIDTH'hFF8, "RO", 0);
		this.WDOGPCELLID2_PCELLID2 = this.WDOGPCELLID2.PCELLID2;
		this.PCELLID2 = this.WDOGPCELLID2.PCELLID2;
      this.WDOGPCELLID3 = ral_reg_WDOGPCELLID3::type_id::create("WDOGPCELLID3",,get_full_name());
      this.WDOGPCELLID3.configure(this, null, "");
      this.WDOGPCELLID3.build();
      this.default_map.add_reg(this.WDOGPCELLID3, `UVM_REG_ADDR_WIDTH'hFFC, "RO", 0);
		this.WDOGPCELLID3_PCELLID3 = this.WDOGPCELLID3.PCELLID3;
		this.PCELLID3 = this.WDOGPCELLID3.PCELLID3;
      this.WDOGRESERVE = ral_reg_WDOGRESERVE::type_id::create("WDOGRESERVE",,get_full_name());
      this.WDOGRESERVE.configure(this, null, "");
      this.WDOGRESERVE.build();
      this.default_map.add_reg(this.WDOGRESERVE, `UVM_REG_ADDR_WIDTH'hFC0, "RO", 0);
		this.WDOGRESERVE_RESERVE = this.WDOGRESERVE.RESERVE;
		this.RESERVE = this.WDOGRESERVE.RESERVE;
   endfunction : build

	`uvm_object_utils(ral_watchdog)

endclass : ral_watchdog



`endif
