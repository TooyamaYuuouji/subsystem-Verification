//------------------------------------------------------------------------------
// 对timer1进行测试

class timer1_test extends base_test;

    `uvm_component_utils(timer1_test)

    extern function new(string name="timer1_test", uvm_component parent=null);
    extern function void build_phase(uvm_phase phase);
    extern task main_phase(uvm_phase phase);
    extern function void final_phase(uvm_phase phase);

endclass: timer1_test

/**************************************************
* implement
**************************************************/
function timer1_test::new(string name="timer1_test", uvm_component parent=null);
    super.new(name, parent);
endfunction: new

function void timer1_test::build_phase(uvm_phase phase);
    super.build_phase(phase);

    ahbl_agt_cfg.is_active = 1;
    uvm_config_db #(ahbl_agent_configuration)::set(this, "env.ahbl_mst_agt", "cfg", ahbl_agt_cfg);
endfunction: build_phase

task timer1_test::main_phase(uvm_phase phase);
    timer1_internal_clock_seq timer1_inclk_seq;
    timer1_external_clock_seq timer1_exclk_seq;
    timer1_external_enable_seq timer1_exen_seq;

    timer1_inclk_seq = timer1_internal_clock_seq::type_id::create("timer1_inclk_seq");
    timer1_exclk_seq = timer1_external_clock_seq::type_id::create("timer1_exclk_seq");
    timer1_exen_seq = timer1_external_enable_seq::type_id::create("timer1_exen_seq");
    phase.raise_objection(this);
    timer1_inclk_seq.start(virt_sqr);
    #500ns;
    timer1_exclk_seq.start(virt_sqr);
    #500ns;
    timer1_exen_seq.start(virt_sqr);
    phase.drop_objection(this);
endtask: main_phase

function void timer1_test::final_phase(uvm_phase phase);
    super.final_phase(phase);
endfunction: final_phase