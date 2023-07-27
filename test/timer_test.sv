
class timer_test extends perips_base_test;

    virtual apb3_interface vif;
    perips_env env;
    // apb3_master_agent agent;

    `uvm_component_utils(timer_test)

    function new(string name="timer_test", uvm_component parent=null);
        super.new(name, parent);
    endfunction: new

    function void build_phase(uvm_phase phase);
        super.build_phase(phase);

        env = perips_env::type_id::create("env", this);

        if(!uvm_config_db #(virtual apb3_interface)::get(this, "", "vif", vif)) begin
            `uvm_fatal("CFGERR", "cannot get virtual apb3_interface from db!")
        end
        uvm_config_db #(virtual apb3_interface)::set(this, "env.agent.*", "vif", vif);
        // agent = apb3_master_agent::type_id::create("agent", this);
        // agent.vif = vif;
    endfunction: build_phase

    function void connect_phase(uvm_phase phase);
        super.connect_phase(phase);

        // env.agent.vif = vif;
    endfunction: connect_phase

    task main_phase(uvm_phase phase);
        virtual_seq v_seq;

        v_seq = virtual_seq::type_id::create("v_seq");
        v_seq.starting_phase = phase;
        v_seq.start(env.vsqr);
    endtask: main_phase

endclass: timer_test