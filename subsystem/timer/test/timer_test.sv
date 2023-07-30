
class timer_test extends perips_base_test;

    apb3_configuration apb3_cfg;

    `uvm_component_utils(timer_test)

    extern function new(string name="timer_test", uvm_component parent=null);
    extern function void build_phase(uvm_phase phase);
    extern function void connect_phase(uvm_phase phase);
    extern task main_phase(uvm_phase phase);

endclass: timer_test

/**************************************************
* implement
**************************************************/
function timer_test::new(string name="timer_test", uvm_component parent=null);
    super.new(name, parent);
endfunction: new

function void timer_test::build_phase(uvm_phase phase);
    super.build_phase(phase);

    apb3_cfg = apb3_configuration::type_id::create("apb3_cfg", this);
    apb3_cfg.apb3_vif = apb3_vif;
    uvm_config_db #(apb3_configuration)::set(this, "env.agent", "config", apb3_cfg);
endfunction: build_phase

function void timer_test::connect_phase(uvm_phase phase);
    super.connect_phase(phase);

endfunction: connect_phase

task timer_test::main_phase(uvm_phase phase);
    // virtual_seq v_seq;

    // v_seq = virtual_seq::type_id::create("v_seq");
    // v_seq.starting_phase = phase;
    // v_seq.start(env.vsqr);

    timer_start_seq st_seq;
    timer_clear_interrupt_seq int_seq;
    timer_stop_seq sp_seq;

    st_seq = timer_start_seq::type_id::create("st_seq");
    assert(st_seq.randomize() with {count_num inside {[1:100]};});
    `uvm_info("DEBUG", $sformatf("Counter Times: %d", st_seq.count_num), UVM_LOW);
    // st_seq.count_num = 32'd10;
    int_seq = timer_clear_interrupt_seq::type_id::create("int_seq");
    sp_seq = timer_stop_seq::type_id::create("sp_seq");

    phase.raise_objection(this);
    sp_seq.start(env.vsqr.apb3_mst_sqr);
    st_seq.start(env.vsqr.apb3_mst_sqr);
    wait(dut_vif.mon_pcb.timer_int);
    // // #0.5us;
    // `uvm_info("DEBUG", $sformatf("Interrupt triggered! Current time:%t", $realtime), UVM_LOW);
    int_seq.start(env.vsqr.apb3_mst_sqr);
    // `uvm_info("DEBUG", $sformatf("Interrupt clear! Current time:%t", $realtime), UVM_LOW);
    sp_seq.start(env.vsqr.apb3_mst_sqr);
    #100ns;
    phase.drop_objection(this);
endtask: main_phase