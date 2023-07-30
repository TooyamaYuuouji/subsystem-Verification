
class perips_scoreboard extends uvm_component;

    uvm_analysis_imp #(apb3_transaction, perips_scoreboard) mon_imp;

    `uvm_component_utils(perips_scoreboard)

    extern function new(string name="perips_scoreboard", uvm_component parent=null);
    extern function void write(apb3_transaction tr);

endclass: perips_scoreboard

/**************************************************
* implement
**************************************************/
function perips_scoreboard::new(string name="perips_scoreboard", uvm_component parent=null);
    super.new(name, parent);

    mon_imp = new("mon_imp", this);
endfunction: new

function void perips_scoreboard::write(apb3_transaction tr);
    // `uvm_info("DEBUG", $sformatf("Check pkt in scoreboard. Current time:%t", $realtime), UVM_LOW);
    // tr.print();
endfunction: write