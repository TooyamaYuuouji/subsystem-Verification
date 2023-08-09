
class base_test extends uvm_test;

    `uvm_component_utils(base_test)

    extern function new(string name="base_test", uvm_component parent=null);
    extern task main_phase(uvm_phase phase);

endclass: base_test

/**************************************************
* implement
**************************************************/
function base_test::new(string name="base_test", uvm_component parent=null);
    super.new(name, parent);
endfunction: new

task base_test::main_phase(uvm_phase phase);
    phase.raise_objection(this);

    `uvm_info("DEBUG", "Hello in base_test", UVM_LOW)
    #1us;

    phase.drop_objection(this);
endtask: main_phase

