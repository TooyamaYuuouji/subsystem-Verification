
class scoreboard extends uvm_scoreboard;

    `uvm_component_utils(scoreboard)

    uvm_analysis_imp #(ahbl_transaction, scoreboard) aimp;
    func_cov fcov;

    extern function new(string name="scoreboard", uvm_component parent=null);
    extern function void write(ahbl_transaction ahbl_tr);

endclass: scoreboard

/**************************************************
* implement
**************************************************/
function scoreboard::new(string name="scoreboard", uvm_component parent=null);
    super.new(name, parent);

    aimp = new("aimp", this);
    fcov = func_cov::type_id::create("fcov");
endfunction: new

function void scoreboard::write(ahbl_transaction ahbl_tr);
    // ahbl_tr.print();
    // fcov.timer0_cg.sample(ahbl_tr);
    fcov.cg_sample(ahbl_tr);
endfunction: write