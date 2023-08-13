
class base_env extends uvm_env;

    `uvm_component_utils(base_env)

    ahbl_mst_agent ahbl_mst_agt;
    scoreboard sb;

    extern function new(string name="base_env", uvm_component parent=null);
    extern function void build_phase(uvm_phase phase);
    extern function void final_phase(uvm_phase phase);
    extern function void connect_phase(uvm_phase phase);

endclass: base_env

/**************************************************
* implement
**************************************************/
function base_env::new(string name="base_env", uvm_component parent=null);
    super.new(name, parent);

    ahbl_mst_agt = ahbl_mst_agent::type_id::create("ahbl_mst_agt", this);
    sb = scoreboard::type_id::create("sb", this);
endfunction: new

function void base_env::build_phase(uvm_phase phase);
    super.build_phase(phase);

endfunction: build_phase

function void base_env::connect_phase(uvm_phase phase);
    super.connect_phase(phase);

    ahbl_mst_agt.ap.connect(sb.aimp);
endfunction: connect_phase

function void base_env::final_phase(uvm_phase phase);
    super.final_phase(phase);

endfunction: final_phase