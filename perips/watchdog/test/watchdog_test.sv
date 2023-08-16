
class watchdog_test extends watchdog_base_test;

    apb3_configuration apb3_cfg;
    ral_watchdog rm;
    apb3_adapter adapter;

    `uvm_component_utils(watchdog_test)

    extern function new(string name="watchdog_test", uvm_component parent=null);
    extern function void build_phase(uvm_phase phase);
    extern function void connect_phase(uvm_phase phase);
    extern task main_phase(uvm_phase phase);

endclass: watchdog_test

/**************************************************
* implement
**************************************************/
function watchdog_test::new(string name="watchdog_test", uvm_component parent=null);
    super.new(name, parent);
endfunction: new

function void watchdog_test::build_phase(uvm_phase phase);
    super.build_phase(phase);

    apb3_cfg = apb3_configuration::type_id::create("apb3_cfg", this);
    apb3_cfg.apb3_vif = apb3_vif;
    uvm_config_db #(apb3_configuration)::set(this, "env", "config", apb3_cfg);
    rm = ral_watchdog::type_id::create("rm", this);
    rm.configure(null, "");
    rm.build();
    rm.lock_model();
    rm.reset();
    adapter = apb3_adapter::type_id::create("adapter");
endfunction: build_phase

function void watchdog_test::connect_phase(uvm_phase phase);
    super.connect_phase(phase);

    rm.default_map.set_auto_predict(1);
    rm.default_map.set_sequencer(env.vsqr.apb3_mst_sqr, adapter);
endfunction: connect_phase

task watchdog_test::main_phase(uvm_phase phase);
    // watchdog_start_seq wd_start_seq;
    // watchdog_clear_interrupt_seq wd_cint_seq;

    // wd_start_seq = watchdog_start_seq::type_id::create("wd_start_seq");
    // wd_cint_seq = watchdog_clear_interrupt_seq::type_id::create("wd_cint_seq");

    // phase.raise_objection(this);
    // wd_start_seq.start(env.vsqr.apb3_mst_sqr);
    // wait(dut_vif.mon_pcb.watchdog_int);
    // wd_cint_seq.start(env.vsqr.apb3_mst_sqr);
    // #2us;
    // phase.drop_objection(this);

    uvm_status_e status;
    uvm_reg_data_t value;

    phase.raise_objection(this);
    // 初始化
    rm.WDOGLOCK.write(status,32'h1ACCE550);
    rm.WDOGLOCK.read(status,value);
    rm.WDOGLOCK.write(status,32'h1ACCE551);
    rm.WDOGLOCK.read(status,value);

    rm.WDOGCONTROL.set(2'b11);
    rm.WDOGCONTROL.update(status);
    rm.WDOGCONTROL.read(status,value);

    rm.WDOGRIS.read(status,value);
    rm.WDOGMIS.read(status,value);
    // 设置初始值
    rm.WDOGLOAD.write(status,32'h0);
    rm.WDOGLOAD.write(status,32'h14);
    rm.WDOGLOAD.read(status,value);
    rm.WDOGVALUE.read(status,value);

    rm.WDOGITCR.write(status,1'b1);
    rm.WDOGITCR.read(status,value);
    rm.WDOGITOP.write(status,2'b11);
    rm.WDOGITCR.write(status,1'b0);

    rm.WDOGPERIPHID4.read(status,value);
    rm.WDOGPERIPHID5a.read(status,value);
    rm.WDOGPERIPHID6a.read(status,value);
    rm.WDOGPERIPHID7a.read(status,value);
    rm.WDOGPERIPHID0.read(status,value);
    rm.WDOGPERIPHID1.read(status,value);
    rm.WDOGPERIPHID2.read(status,value);
    rm.WDOGPERIPHID3.read(status,value);
    rm.WDOGPCELLID0.read(status,value);
    rm.WDOGPCELLID1.read(status,value);
    rm.WDOGPCELLID2.read(status,value);
    rm.WDOGPCELLID3.read(status,value);
    rm.WDOGRESERVE.read(status,value);
    // 等待中断
    wait(dut_vif.mon_pcb.watchdog_int);
    // 清除中断
    rm.WDOGINTCLR.write(status,1'b1);
    rm.WDOGINTCLR.read(status,value);
    $display("1 %t",$realtime);

    rm.WDOGLOAD.read(status, value);
    // 等待中断
    wait(dut_vif.mon_pcb.watchdog_int);
    $display("2 %t",$realtime);
    // 清除中断
    rm.WDOGINTCLR.write(status,1'b1);
    $display("3 %t",$realtime);
    // 等待中断
    wait(dut_vif.mon_pcb.watchdog_int);
    $display("4 %t",$realtime);
    // 清除中断
    rm.WDOGINTCLR.write(status,1'b1);
    $display("5 %t",$realtime);
    //rm.VALUE.peek(status, value);
    //`uvm_info("DEBUG", $sformatf("backdoor, VALUE = %x", value[31:0]), UVM_LOW);

    #100ns;
    phase.drop_objection(this);
endtask: main_phase