
class perips_base_test extends uvm_test;

    virtual apb3_interface apb3_vif;
    virtual dut_interface dut_vif;
    perips_env env;

    `uvm_component_utils(perips_base_test)

    extern function new(string name="perips_base_test", uvm_component parent=null);
    extern function void build_phase(uvm_phase phase);
    extern function void final_phase(uvm_phase phase);

endclass: perips_base_test

/**************************************************
* implement
**************************************************/
function perips_base_test::new(string name="perips_base_test", uvm_component parent=null);
    super.new(name, parent);
endfunction: new

function void perips_base_test::build_phase(uvm_phase phase);
    super.build_phase(phase);

    env = perips_env::type_id::create("env", this);

    if(!uvm_config_db #(virtual apb3_interface)::get(this, "", "apb3_vif", apb3_vif)) begin
        `uvm_fatal("CFGERR", "cannot get virtual apb3_interface from db!")
    end
    if(!uvm_config_db #(virtual dut_interface)::get(this, "", "dut_vif", dut_vif)) begin
        `uvm_fatal("CFGERR", "cannot get virtual dut_interface from db!")
    end
endfunction: build_phase

function void perips_base_test::final_phase(uvm_phase phase);
    super.final_phase(phase);

    uvm_top.print_topology();
endfunction: final_phase