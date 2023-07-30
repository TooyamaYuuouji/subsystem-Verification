
class apb3_master_monitor extends uvm_monitor;

    virtual apb3_interface vif = null;
    uvm_analysis_port #(apb3_transaction) ap;

    `uvm_component_utils(apb3_master_monitor)

    extern function new(string name="apb3_master_monitor", uvm_component parent=null);
    extern function void build_phase(uvm_phase phase);
    extern function void connect_phase(uvm_phase phase);
    extern task main_phase(uvm_phase phase);
    extern task wait_reset();
    extern task monitor_thread();
    extern task monitor_one_pkt();

endclass: apb3_master_monitor

/**************************************************
* implement
**************************************************/
function apb3_master_monitor::new(string name="apb3_master_monitor", uvm_component parent=null);
    super.new(name, parent);

    ap = new("ap", this);
endfunction: new

function void apb3_master_monitor::build_phase(uvm_phase phase);
    super.build_phase(phase);

endfunction: build_phase

function void apb3_master_monitor::connect_phase(uvm_phase phase);
    super.connect_phase(phase);

endfunction: connect_phase

task apb3_master_monitor::main_phase(uvm_phase phase); 
    while(1) begin
        wait_reset();
        fork
            @(negedge vif.PRESETn);
            monitor_thread();
        join_any
        disable fork;
    end
endtask: main_phase

task apb3_master_monitor::wait_reset();
    wait(vif.PRESETn);
endtask: wait_reset

task apb3_master_monitor::monitor_thread();
    while(1) begin
        monitor_one_pkt();
    end
endtask: monitor_thread

task apb3_master_monitor::monitor_one_pkt();
    apb3_transaction tr;

    tr = apb3_transaction::type_id::create("tr");
    do begin
        @(vif.mon_pcb);
    end while(!vif.mon_pcb.PSEL);
    @(vif.mon_pcb);
    tr.addr = vif.mon_pcb.PADDR;
    tr.wdata = vif.mon_pcb.PWDATA;
    tr.rdata = vif.mon_pcb.PRDATA;
    while(!vif.mon_pcb.PREADY);
    ap.write(tr);
endtask: monitor_one_pkt