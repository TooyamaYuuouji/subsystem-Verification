
class perips_base_test extends uvm_test;

    `uvm_component_utils(perips_base_test)

    function new(string name="perips_base_test", uvm_component parent=null);
        super.new(name, parent);
    endfunction: new

    function void build_phase(uvm_phase phase);
        super.build_phase(phase);
    endfunction: build_phase

    function void final_phase(uvm_phase phase);
        super.final_phase(phase);

        uvm_top.print_topology();
    endfunction: final_phase

endclass: perips_base_test