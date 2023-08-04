
class timer_test extends base_test;

    apb3_configuration apb3_cfg;
    ral_timer rm;
    apb3_adapter adapter;

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
	apb3_cfg.is_active = UVM_PASSIVE;
    uvm_config_db #(apb3_configuration)::set(this, "env", "config", apb3_cfg);

    rm = ral_timer::type_id::create("rm", this);
    rm.configure(null, "");
    rm.build();
    rm.lock_model();
    rm.reset();
    rm.set_hdl_path_root("timer_tb.DUT");
    adapter = apb3_adapter::type_id::create("adapter");
endfunction: build_phase

function void timer_test::connect_phase(uvm_phase phase);
    super.connect_phase(phase);

    rm.default_map.set_auto_predict(1);
    rm.default_map.set_sequencer(env.vsqr.apb3_mst_sqr, adapter);
endfunction: connect_phase

task timer_test::main_phase(uvm_phase phase);
    // timer_start_seq st_seq;
    // timer_clear_interrupt_seq int_seq;
    // timer_stop_seq sp_seq;

    // st_seq = timer_start_seq::type_id::create("st_seq");
    // assert(st_seq.randomize() with {count_num inside {[10:200]};});
    // `uvm_info("DEBUG", $sformatf("Counter Times: %d", st_seq.count_num), UVM_LOW);
    // // st_seq.count_num = 32'd10;
    // int_seq = timer_clear_interrupt_seq::type_id::create("int_seq");
    // sp_seq = timer_stop_seq::type_id::create("sp_seq");

    // phase.raise_objection(this);
    // sp_seq.start(env.vsqr.apb3_mst_sqr);
    // st_seq.start(env.vsqr.apb3_mst_sqr);
    // wait(dut_vif.mon_pcb.timer_int);
    
    // // // #0.5us;
    // // `uvm_info("DEBUG", $sformatf("Interrupt triggered! Current time:%t", $realtime), UVM_LOW);
    // int_seq.start(env.vsqr.apb3_mst_sqr);
    // // `uvm_info("DEBUG", $sformatf("Interrupt clear! Current time:%t", $realtime), UVM_LOW);
    // sp_seq.start(env.vsqr.apb3_mst_sqr);
    // #100ns;
    // phase.drop_objection(this);

    uvm_status_e status;
    uvm_reg_data_t value;

    phase.raise_objection(this);
        // 初始化
        rm.CTRL_INT_EN.set(0);
        rm.CTRL_EX.set(0);
        rm.CTRL_EX_EN.set(0);
        rm.CTRL_EN.set(0);
        rm.CTRL.update(status);
        // 发送激励
        rm.RELOAD.write(status, 32'd14);
        
        rm.CTRL.INT_EN.set(1);
        rm.CTRL.EX.set(0);
        rm.CTRL.EX_EN.set(0);
        rm.CTRL.EN.set(1);
        rm.CTRL.update(status);
        rm.VALUE.peek(status, value);
        `uvm_info("DEBUG", $sformatf("backdoor, VALUE = %x", value[31:0]), UVM_LOW);
        // 等待中断
        wait(dut_vif.mon_pcb.timer_int);
        // 清除中断
        rm.INTCLEAR.INT.set(1);
        rm.INTCLEAR.update(status);

        rm.VALUE.read(status, value);

        // 终止运行
        rm.CTRL.INT_EN.set(1);
        rm.CTRL.EX.set(0);
        rm.CTRL.EX_EN.set(0);
        rm.CTRL.EN.set(0);
        rm.CTRL.update(status);
        #100ns;
    phase.drop_objection(this);

endtask: main_phase
