
class dualtimer_test extends perips_base_test;

    apb3_configuration apb3_cfg;

    `uvm_component_utils(dualtimer_test)

    extern function new(string name="dualtimer_test", uvm_component parent=null);
    extern function void build_phase(uvm_phase phase);
    extern function void connect_phase(uvm_phase phase);
    extern task main_phase(uvm_phase phase);

endclass: dualtimer_test

/**************************************************
* implement
**************************************************/
function dualtimer_test::new(string name="dualtimer_test", uvm_component parent=null);
    super.new(name, parent);
endfunction: new

function void dualtimer_test::build_phase(uvm_phase phase);
    super.build_phase(phase);

    apb3_cfg = apb3_configuration::type_id::create("apb3_cfg", this);
    apb3_cfg.apb3_vif = apb3_vif;
    uvm_config_db #(apb3_configuration)::set(this, "env.agent", "config", apb3_cfg);
endfunction: build_phase

function void dualtimer_test::connect_phase(uvm_phase phase);
    super.connect_phase(phase);

endfunction: connect_phase

task dualtimer_test::main_phase(uvm_phase phase);
    dualtimer_start_seq dt_start_seq;
    dualtimer_clear_interrupt_seq dt_cint_seq;
    dualtimer_stop_seq dt_stop_seq;

    dt_start_seq = dualtimer_start_seq::type_id::create("dt_start_seq");
    dt_cint_seq = dualtimer_clear_interrupt_seq::type_id::create("dt_cint_seq");
    dt_stop_seq = dualtimer_stop_seq::type_id::create("dt_stop_seq");
    assert(dt_start_seq.randomize() with {count_num inside {[1:100]};});
    `uvm_info("DEBUG", $sformatf("Counter Times: %d", dt_start_seq.count_num), UVM_LOW);

    phase.raise_objection(this);
    dt_stop_seq.start(env.vsqr.apb3_mst_sqr);
    dt_start_seq.start(env.vsqr.apb3_mst_sqr);
    wait(dut_vif.mon_pcb.dualtimer_int1);
    `uvm_info("DEBUG", $sformatf("Interrupt triggered! Current time:%t", $realtime), UVM_LOW);
    dt_cint_seq.start(env.vsqr.apb3_mst_sqr);
    dt_stop_seq.start(env.vsqr.apb3_mst_sqr);
    #2us;
    phase.drop_objection(this);
endtask: main_phase