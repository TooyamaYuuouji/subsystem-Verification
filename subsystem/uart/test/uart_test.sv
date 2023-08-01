
class uart_test extends perips_base_test;

    apb3_configuration apb3_cfg;

    `uvm_component_utils(uart_test)

    extern function new(string name="uart_test", uvm_component parent=null);
    extern function void build_phase(uvm_phase phase);
    extern function void connect_phase(uvm_phase phase);
    extern task main_phase(uvm_phase phase);

endclass: uart_test

/**************************************************
* implement
**************************************************/
function uart_test::new(string name="uart_test", uvm_component parent=null);
    super.new(name, parent);
endfunction: new

function void uart_test::build_phase(uvm_phase phase);
    super.build_phase(phase);

    apb3_cfg = apb3_configuration::type_id::create("apb3_cfg", this);
    apb3_cfg.apb3_vif = apb3_vif;
    uvm_config_db #(apb3_configuration)::set(this, "env.agent", "config", apb3_cfg);
endfunction: build_phase

function void uart_test::connect_phase(uvm_phase phase);
    super.connect_phase(phase);

endfunction: connect_phase

task uart_test::main_phase(uvm_phase phase);
    uart_bauddiv_seq u_baud_seq;
    uart_start_seq u_start_seq;
    uart_set_tx_data_seq u_tx_seq;
    uart_clear_interrupt_seq u_cint_seq;

    u_baud_seq = uart_bauddiv_seq::type_id::create("u_baud_seq");
    u_start_seq = uart_start_seq::type_id::create("u_start_seq");
    u_tx_seq = uart_set_tx_data_seq::type_id::create("u_tx_seq");
    u_cint_seq = uart_clear_interrupt_seq::type_id::create("u_cint_seq");

    phase.raise_objection(this);
    u_baud_seq.start(env.vsqr.apb3_mst_sqr);
    u_start_seq.start(env.vsqr.apb3_mst_sqr);
    assert(u_tx_seq.randomize());
    u_tx_seq.start(env.vsqr.apb3_mst_sqr);
    wait(dut_vif.mon_pcb.uart_txint);
    u_cint_seq.start(env.vsqr.apb3_mst_sqr);
    #10us; // 传递第二个数据
    assert(u_tx_seq.randomize());
    u_tx_seq.start(env.vsqr.apb3_mst_sqr);
    wait(dut_vif.mon_pcb.uart_txint);
    u_cint_seq.start(env.vsqr.apb3_mst_sqr);

    #25us; // 等待最后一个数据传输完成
    phase.drop_objection(this);
endtask: main_phase