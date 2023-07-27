
class apb3_master_driver extends uvm_driver #(apb3_transaction, apb3_transaction);

    virtual apb3_interface vif = null;

    `uvm_component_utils(apb3_master_driver)

    function new(string name="apb3_master_driver", uvm_component parent=null);
        super.new(name, parent);
    endfunction: new

    function void build_phase(uvm_phase phase);
        super.build_phase(phase);

        if(!uvm_config_db #(virtual apb3_interface)::get(this, "", "vif", vif)) begin
            `uvm_fatal("CFGERR", "cannot get virtual apb3_interface from db!")
        end
    endfunction: build_phase

    function void connect_phase(uvm_phase phase);
        super.connect_phase(phase);

        // if(vif == null) begin
        //     `uvm_fatal("NULVIF", "virtual interface cannot be null!")
        // end
    endfunction: connect_phase

    task main_phase(uvm_phase phase); 
        while(1) begin
            do_reset();
            fork
                @(negedge vif.PRESETn);
                drive_thread();
            join_any
            disable fork;
        end
    endtask: main_phase

    extern task do_reset();
    extern task drive_thread();
    extern task drive_one_pkt(ref apb3_transaction pkt);
    extern task wait_for_done();
    extern task drive_done();

endclass: apb3_master_driver

/**************************************************
* implement
**************************************************/
task apb3_master_driver::do_reset();
    vif.mst_drv_pcb.PSEL <= 0;
    vif.mst_drv_pcb.PENABLE <= 0;
    vif.mst_drv_pcb.PWRITE <= 0;
    vif.mst_drv_pcb.PADDR <= 'd0;
    vif.mst_drv_pcb.PWDATA <= 'd0;
    vif.mst_drv_pcb.PCLKG <= 0;
    wait(vif.PRESETn);
endtask: do_reset

task apb3_master_driver::drive_thread();
    while(1) begin
        seq_item_port.get_next_item(req);
        drive_one_pkt(req);
        wait_for_done();
        drive_done();
        seq_item_port.item_done();
    end
endtask: drive_thread

task apb3_master_driver::drive_one_pkt(ref apb3_transaction pkt);
    @(vif.mst_drv_pcb);
    vif.mst_drv_pcb.PSEL <= 1;
    vif.mst_drv_pcb.PENABLE <= 0;
    vif.mst_drv_pcb.PWRITE <= pkt.wen;
    vif.mst_drv_pcb.PADDR <= pkt.addr;
    if(pkt.wen == 1) begin
        vif.mst_drv_pcb.PWDATA <= pkt.wdata;
    end
    @(vif.mst_drv_ncb);
    vif.mst_drv_ncb.PCLKG <= 1;
    @(vif.mst_drv_pcb);
    vif.mst_drv_pcb.PENABLE <= 1;
    vif.mst_drv_pcb.PCLKG <= 0;
endtask: drive_one_pkt

task apb3_master_driver::wait_for_done();
    do begin
        @(vif.mst_drv_pcb);
    end while(!vif.mst_drv_pcb.PREADY);
endtask: wait_for_done

task apb3_master_driver::drive_done();
    vif.mst_drv_pcb.PSEL <= 0;
    vif.mst_drv_pcb.PENABLE <= 0;
endtask: drive_done