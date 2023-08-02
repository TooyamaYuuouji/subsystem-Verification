
class reg_CTRL extends uvm_reg;

    rand uvm_reg_field INT_EN;
	rand uvm_reg_field EX;
	rand uvm_reg_field EX_EN;
	rand uvm_reg_field EN;

    `uvm_object_utils(reg_CTRL)

    extern function new(string name="reg_CTRL");
    extern virtual function void build();

endclass: reg_CTRL

/**************************************************
* implement
**************************************************/
function reg_CTRL::new(string name="reg_CTRL");
    super.new(name, 32, UVM_NO_COVERAGE);
endfunction: new
function void reg_CTRL::build();
    this.INT_EN = uvm_reg_field::type_id::create("INT_EN",,get_full_name());
    this.INT_EN.configure(this, 1, 3, "RW", 0, 1'b0, 1, 0, 0);
    this.EX = uvm_reg_field::type_id::create("EX",,get_full_name());
    this.EX.configure(this, 1, 2, "RW", 0, 1'b0, 1, 0, 0);
    this.EX_EN = uvm_reg_field::type_id::create("EX_EN",,get_full_name());
    this.EX_EN.configure(this, 1, 1, "RW", 0, 1'b0, 1, 0, 0);
    this.EN = uvm_reg_field::type_id::create("EN",,get_full_name());
    this.EN.configure(this, 1, 0, "RW", 0, 1'b0, 1, 0, 0);
endfunction: build



class reg_VALUE extends uvm_reg;

    rand uvm_reg_field R_VALUE;

    `uvm_object_utils(reg_VALUE)

    extern function new(string name="reg_VALUE");
    extern virtual function void build();

endclass: reg_VALUE

/**************************************************
* implement
**************************************************/
function reg_VALUE::new(string name="reg_VALUE");
    super.new(name, 32, UVM_NO_COVERAGE);
endfunction: new
function void reg_VALUE::build();
    R_VALUE = uvm_reg_field::type_id::create("R_VALUE");
    R_VALUE.configure(this, 32, 0, "RW", 1, 0, 1, 1, 0);
endfunction: build



class reg_RELOAD extends uvm_reg;

    rand uvm_reg_field R_VALUE;

    `uvm_object_utils(reg_RELOAD)

    extern function new(string name="reg_RELOAD");
    extern virtual function void build();

endclass: reg_RELOAD

/**************************************************
* implement
**************************************************/
function reg_RELOAD::new(string name = "reg_RELOAD");
    super.new(name, 32,build_coverage(UVM_NO_COVERAGE));
endfunction: new
function void reg_RELOAD::build();
    this.R_VALUE = uvm_reg_field::type_id::create("R_VALUE",,get_full_name());
    this.R_VALUE.configure(this, 32, 0, "RW", 0, 32'd0, 1, 0, 1);
endfunction: build



class reg_INTCLEAR extends uvm_reg;

    rand uvm_reg_field INT;

    `uvm_object_utils(reg_INTCLEAR)

    extern function new(string name="reg_INTCLEAR");
    extern virtual function void build();

endclass: reg_INTCLEAR

/**************************************************
* implement
**************************************************/
function reg_INTCLEAR::new(string name = "reg_INTCLEAR");
		super.new(name, 32,build_coverage(UVM_NO_COVERAGE));
	endfunction: new
function void reg_INTCLEAR::build();
    this.INT = uvm_reg_field::type_id::create("INT",,get_full_name());
    this.INT.configure(this, 1, 0, "RW", 0, 1'b0, 1, 0, 1);
endfunction: build



class ral_timer extends uvm_reg_block;

    rand reg_CTRL CTRL;
    rand reg_VALUE VALUE;
    rand reg_RELOAD RELOAD;
    rand reg_INTCLEAR INTCLEAR;

    `uvm_object_utils(ral_timer);

    extern function new(string name="ral_timer");
    extern virtual function void build();
endclass: ral_timer
/**************************************************
* implement
**************************************************/
function ral_timer::new(string name="ral_timer");
    super.new(name, UVM_NO_COVERAGE);
endfunction: new
function void ral_timer::build();
    default_map = create_map("default_map", 0, 4, UVM_BIG_ENDIAN, 0);

    CTRL = reg_CTRL::type_id::create("CTRL",, get_full_name());
    CTRL.configure(this, null, "");
    CTRL.build();
    default_map.add_reg(CTRL, 'h000, "RW");

    VALUE = reg_VALUE::type_id::create("VALUE", , get_full_name());
    VALUE.configure(this, null, "");
    VALUE.build();
    default_map.add_reg(VALUE, 'h004, "RW");

    RELOAD = reg_RELOAD::type_id::create("RELOAD",, get_full_name());
    RELOAD.configure(this, null, "");
    RELOAD.build();
    default_map.add_reg(RELOAD, 'h008, "RW");

    INTCLEAR = reg_INTCLEAR::type_id::create("INTCLEAR",, get_full_name());
    INTCLEAR.configure(this, null, "");
    INTCLEAR.build();
    default_map.add_reg(INTCLEAR, 'h00C, "RW");
endfunction: build