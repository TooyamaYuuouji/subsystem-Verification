
class base_env extends uvm_env;

    virtual_sequencer vsqr;
    apb3_configuration config;
    scoreboard sb;
    apb3_master_agent agent;

    `uvm_component_utils(base_env)

    extern function new(string name="base_env", uvm_component parent=null);
    extern function void build_phase(uvm_phase phase);
    extern function void connect_phase(uvm_phase phase);

endclass: base_env

/**************************************************
* implement
**************************************************/
function base_env::new(string name="base_env", uvm_component parent=null);
    super.new(name, parent);
endfunction: new

function void base_env::build_phase(uvm_phase phase);
    super.build_phase(phase);

    if(!uvm_config_db #(apb3_configuration)::get(this, "", "config", config)) begin
        `uvm_fatal("CFGERR", "cannot get apb3_configuration from db!")
    end

    vsqr = virtual_sequencer::type_id::create("vsqr", this);
    sb = scoreboard::type_id::create("sb", this);
    sb.config = config;
    agent = apb3_master_agent::type_id::create("agent", this);
    agent.config = config;

    uvm_config_db #(uvm_object_wrapper)::set(this, "agent.sequencer.main_phase", "default_sequence", null); // 禁止agent中sequencer的默认启动
    // uvm_config_db #(uvm_object_wrapper)::set(this, "vsqr.main_phase", "default_sequence", virtual_seq::get_type()); // 将所有sequence绑定到virtual sequence
endfunction: build_phase

function void base_env::connect_phase(uvm_phase phase);
    super.connect_phase(phase);

    vsqr.apb3_mst_sqr = agent.sequencer; // 建立连接
    agent.mon_ap.connect(sb.mon_imp);
endfunction: connect_phase
