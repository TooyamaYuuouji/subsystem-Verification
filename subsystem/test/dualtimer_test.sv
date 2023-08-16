//------------------------------------------------------------------------------
// 对dualtimer进行测试

class dualtimer_test extends base_test;

    `uvm_component_utils(dualtimer_test)

    extern function new(string name="dualtimer_test", uvm_component parent=null);
    extern function void build_phase(uvm_phase phase);
    extern task main_phase(uvm_phase phase);
    extern function void final_phase(uvm_phase phase);

endclass: dualtimer_test

/**************************************************
* implement
**************************************************/
function dualtimer_test::new(string name="dualtimer_test", uvm_component parent=null);
    super.new(name, parent);
endfunction: new

function void dualtimer_test::build_phase(uvm_phase phase);
    super.build_phase(phase);

    ahbl_agt_cfg.is_active = 1;
    uvm_config_db #(ahbl_agent_configuration)::set(this, "env.ahbl_mst_agt", "cfg", ahbl_agt_cfg);
endfunction: build_phase

task dualtimer_test::main_phase(uvm_phase phase);
    dualtimer1_16p_0spre_seq dt1_16p_0s_seq;
    dualtimer1_16fr_4spre_seq dt1_16fr_4s_seq;
    dualtimer1_32p_8spre_seq dt1_32p_8s_seq;
    dualtimer2_16p_0spre_seq dt2_16p_0s_seq;
    dualtimer2_16fr_4spre_seq dt2_16fr_4s_seq;
    dualtimer2_32p_8spre_seq dt2_32p_8s_seq;

    dt1_16p_0s_seq = dualtimer1_16p_0spre_seq::type_id::create("dt1_16p_0s_seq");
    dt1_16fr_4s_seq = dualtimer1_16fr_4spre_seq::type_id::create("dt1_16fr_4s_seq");
    dt1_32p_8s_seq = dualtimer1_32p_8spre_seq::type_id::create("dt1_32p_8s_seq");
    dt2_16p_0s_seq = dualtimer2_16p_0spre_seq::type_id::create("dt2_16p_0s_seq");
    dt2_16fr_4s_seq = dualtimer2_16fr_4spre_seq::type_id::create("dt2_16fr_4s_seq");
    dt2_32p_8s_seq = dualtimer2_32p_8spre_seq::type_id::create("dt2_32p_8s_seq");
    phase.raise_objection(this);

    dt1_16p_0s_seq.start(virt_sqr);
    dt1_16fr_4s_seq.start(virt_sqr);
    dt1_32p_8s_seq.start(virt_sqr);
    dt2_16p_0s_seq.start(virt_sqr);
    dt2_16fr_4s_seq.start(virt_sqr);
    dt2_32p_8s_seq.start(virt_sqr);

    phase.drop_objection(this);
endtask: main_phase

function void dualtimer_test::final_phase(uvm_phase phase);
    super.final_phase(phase);
endfunction: final_phase